import Foundation

struct BookEntity: Identifiable {
    var id: UUID
    var title: String
    var ISBN13: String
    var thumbnail: String
    var authors: [String]
}
