import Foundation


class LibraryViewModel: ObservableObject {
    @Published var books: [BookEntity] = []
    var libraryRepository: LibraryRepositoryProtocol
    
    
    init(libraryRepository:LibraryRepositoryProtocol) {
        self.libraryRepository = libraryRepository
    }
    
    
    func fetchBooks() async throws {
        let fetchBooksUseCase = FetchBooksUseCase(libraryRepository: libraryRepository)
        do {
            let books = try await fetchBooksUseCase.execute()
            DispatchQueue.main.async { [weak self] in
                self?.books = books
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.books = []
            }
            throw error
        }
    }
}
