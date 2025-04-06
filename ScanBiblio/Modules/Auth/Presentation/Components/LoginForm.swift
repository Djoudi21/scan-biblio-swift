import SwiftUI

struct LoginForm: View {
    @EnvironmentObject var viewModel: AuthViewModel // Access the ViewModel from the environment
    var body: some View {
        TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
        SecureField("Password", text: $viewModel.password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
                .foregroundColor(.red)
                .padding()
        }
        
        CustomButton(label: "Login") {
           Task {
                try await viewModel.login()
            }
        }
    }
}
