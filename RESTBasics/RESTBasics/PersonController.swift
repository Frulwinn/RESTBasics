import Foundation

private let  baseURL = URL(string: "https://swapi.co/api/people/")!

class PersonController {
    
    private enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func searchForPeople(with searchTerm: String, completion: @escaping ([Person]?, Error?) -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchQuaryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents.queryItems = [searchQuaryItem]
        
        guard let requestURL = urlComponents.url else {
            NSLog("problem constructing search URL for \(searchTerm)")
            completion(nil, NSError())
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data: \(error)")
                completion(nil, error)
            }
            guard let data = data else {
                NSLog ("Error fetching data. No data returned")
                completion(nil, NSError())
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let searchResults = try jsonDecoder.decode(PersonSearchResults.self, from: data)
                let people = searchResults.results
                completion(people, nil)
            } catch {
                NSLog("unable to decode data into people: \(error)")
                completion(nil, error)
                return
            }
        }
        dataTask.resume()
    }
}
