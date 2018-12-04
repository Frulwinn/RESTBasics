import Foundation

private let  baseURL = URL(string: "https://swapi.co/api/people/")!

class PersonController {
    func searchForPeople(with searchTerm: String, completion: @escaping ([Person]?, Error?) -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchQuaryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents.queryItems = [searchQuaryItem]
        
        guard let requestURL = urlComponents.url else {
            NSLog("problem constructing search URL for \(searchTerm)")
            completion(nil, NSError())
            return
        }
    }
}
