import SwiftUI

struct BookListItem: View {
    @Binding var book: BookEntity

    var body: some View {
        VStack() {
            Text(book.title)
                .font(.headline)
            
            Text("Auteur(s): \(book.authors.joined(separator: ", "))")
            // Load thumbnail image
            if let url = URL(string: book.thumbnail) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 90)
                        .cornerRadius(8)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 90)
                        .cornerRadius(8)
                }
            }

            Text(book.ISBN13)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(4)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1) // Border color and thickness
        )
    }
}


#Preview {
    BookListItem(book: .constant(BookEntity(id: UUID(), title: "title", ISBN13: "124", thumbnail: "thumbnail", authors: [])))
}
