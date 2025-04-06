import SwiftUI

struct LibraryScreen: View {
    @EnvironmentObject var viewModel: LibraryViewModel
    var body: some View {
        VStack {
            BookList(books: $viewModel.books)
        }
        .task {
            do {
                try await viewModel.fetchBooks()
            } catch {}
        }
    }
}

#Preview {
    var libraryRepository = InMemoryLibraryRepository()
    LibraryScreen()
        .environmentObject(LibraryViewModel(libraryRepository: libraryRepository))

}
