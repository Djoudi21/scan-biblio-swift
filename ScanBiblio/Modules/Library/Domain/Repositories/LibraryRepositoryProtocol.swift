import Foundation


protocol LibraryRepositoryProtocol {
    func fetchBooks() async throws -> [FetchBooksResponseDto]
}
