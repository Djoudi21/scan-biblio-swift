import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var authViewModel: AuthViewModel
    @StateObject private var libraryViewModel: LibraryViewModel
    
    
    init() {
        let authRepository = InMemoryAuthRepository()
        let libraryRepository = HttpLibraryRepository()
        _authViewModel = StateObject(wrappedValue: AuthViewModel(authRepository: authRepository))
        _libraryViewModel = StateObject(wrappedValue: LibraryViewModel(libraryRepository: libraryRepository))
    }
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                TabsView()
                    .environmentObject(libraryViewModel)
            } else {
                LoginScreen()
                    .environmentObject(authViewModel)
            }
        }
    }
    
    #Preview {
        ContentView()
            .modelContainer(for: Item.self, inMemory: true)
    }
}
