import Foundation

struct Person: Codable {
    var name: String
    var gender: String
    var birthYear: String
}

struct PersonSearchResults: Codable {
    var results: [Person]
}
