import SwiftUI

struct TabsView: View {
    @State private var selectedTab = 2
    
    var body: some View {
                TabView(selection: $selectedTab) {
                    ScanScreen()
                        .tabItem {
                            Label("Camera", systemImage: "camera.fill")
                        }.tag(2)
                    HistoryScreen()
                        .tabItem {
                            Label("History", systemImage: "clock.fill")
                        }.tag(0)
                    LibraryScreen()
                        .tabItem {
                            Label("Library", systemImage: "book.fill")
                        }.tag(1)
                }
            }
}

#Preview {
    TabsView()
}
