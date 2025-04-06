import Foundation

class FetchBooksUseCase {
    private var libraryRepository: LibraryRepositoryProtocol
    private var mapper = FetchBooksMapper()
    
    init(libraryRepository: LibraryRepositoryProtocol){
       self.libraryRepository = libraryRepository
    }
    
    func execute()  async throws -> [BookEntity] {
        let books = try await libraryRepository.fetchBooks()
        var bookEntities: [BookEntity] = []
        
        for book in books {
            let bookEntity = mapper.toEntity(book)
            bookEntities.append(bookEntity)
        }
        return bookEntities
    }
}
