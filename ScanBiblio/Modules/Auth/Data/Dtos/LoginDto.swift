import Foundation

class LoginDto: Codable {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    // MARK: - Coding Keys
//    enum CodingKeys: String, CodingKey {
//        case email
//        case password
//    }
    
    // MARK: - Decodable Implementation
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        email = try container.decode(String.self, forKey: .email)
//        password = try container.decode(String.self, forKey: .password)
//    }
}
