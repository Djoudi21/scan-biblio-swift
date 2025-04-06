import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var viewModel: AuthViewModel // Access the ViewModel from the environment
    @State private var isRegisterViewPresented = false // State to trigger the modal

    var body: some View {
        NavigationStack() {
            VStack {
                Text("ScanBiblio")
                    .font(.largeTitle)
                    .padding()

                LoginForm()
            }
            .padding()
        }
    }
}
