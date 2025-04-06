import Foundation

class FetchBooksResponseDto: Decodable {
    var id: UUID
    var title: String
    var ISBN13: String
    var thumbnail: String
    var authors: [String]
    
    init( id: UUID,
          title: String,
          ISBN13: String,
          thumbnail: String,
          authors: [String]) {
        self.id = id
        self.title = title
        self.ISBN13 = ISBN13
        self.thumbnail = thumbnail
        self.authors = authors
    }
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case ISBN13
        case thumbnail
        case authors
    }
    
    // MARK: - Decodable Implementation
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        ISBN13 = try container.decode(String.self, forKey: .ISBN13)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        authors = try container.decode([String].self, forKey: .authors)
    }
    
    // MARK: - Decode from the Top-Level Dictionary
    static func decode(from data: Data) throws -> [FetchBooksResponseDto] {
        let decoder = JSONDecoder()
        
        // Decode the top-level dictionary
        let rootObject = try decoder.decode([String: [FetchBooksResponseDto]].self, from: data)
        
        // Return the "books" array
        if let books = rootObject["books"] {
            return books
        } else {
            throw APIError.decodingError
        }
    }
}
