import Foundation

class FetchBooksMapper {
    func toEntity(_ data: FetchBooksResponseDto) -> BookEntity {
        return BookEntity(id: data.id, title: data.title, ISBN13: data.ISBN13, thumbnail: data.thumbnail, authors: data.authors)
    }
}
