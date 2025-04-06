import SwiftUI

struct BookList: View {
    @Binding var books: [BookEntity]
    var body: some View {
        ScrollView() {
            VStack {
                ForEach($books) { book in
                    BookListItem(book: book)
                }
            }.padding(14)
        }
    }
}

#Preview {
    BookList(books: .constant([BookEntity(id: UUID(), title: "title", ISBN13: "234", thumbnail: "thumbnail", authors: [])]))
}
