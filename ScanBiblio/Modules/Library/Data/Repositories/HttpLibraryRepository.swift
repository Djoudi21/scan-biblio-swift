import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class HttpLibraryRepository: LibraryRepositoryProtocol {
    func fetchBooks() async throws -> [FetchBooksResponseDto] {
        // Fetch the base URL from environment variables
        guard let baseURL = ProcessInfo.processInfo.environment["SCAN_BIBLIO_API_BASE_URL"],
              let url = URL(string: "\(baseURL)/books") else {
            throw APIError.invalidURL // Handle invalid URL error
        }
        
        do {
            // Make the network request asynchronously
            let (data, response) = try await URLSession.shared.data(from: url)
            // Check if the response is valid and has a status code of 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse // Handle invalid response error
            }            
            return try FetchBooksResponseDto.decode(from: data)
            
            
        } catch let decodingError as DecodingError {
            print("Decoding error: \(decodingError.localizedDescription)")
            switch decodingError {
            case .typeMismatch(let type, let context):
                print("Type mismatch for type \(type) in \(context)")
            case .valueNotFound(let type, let context):
                print("Value not found for type \(type) in \(context)")
            case .keyNotFound(let key, let context):
                print("Key '\(key)' not found in \(context)")
            case .dataCorrupted(let context):
                print("Data corrupted: \(context)")
            @unknown default:
                print("Unknown decoding error")
            }
            return []
        } catch {
            throw error
        }
    }
}

