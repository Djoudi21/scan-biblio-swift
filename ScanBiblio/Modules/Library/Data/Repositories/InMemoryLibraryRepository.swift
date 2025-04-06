import Foundation

class InMemoryLibraryRepository: LibraryRepositoryProtocol {
    func fetchBooks() async throws -> [FetchBooksResponseDto] {
        return [
            FetchBooksResponseDto(id: UUID(), title: "Fairy Tail T06", ISBN13: "9782811607555", thumbnail: "https://books.google.com/books/content?id=6Y4fAAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", authors: ["Hiro Mashima"]),
            FetchBooksResponseDto(id: UUID(), title: "Fairy Tail T06", ISBN13: "9782811607555", thumbnail: "https://books.google.com/books/content?id=6Y4fAAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api", authors: ["Hiro Mashima"])
        ]
    }
}
