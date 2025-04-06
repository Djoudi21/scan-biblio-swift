import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var email: String = "julien"
    @Published var password: String = "1234"
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String? = nil
    var authRepository: AuthRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func login() async throws {
        let loginUseCase = LoginUseCase(authRepository: authRepository)

        guard !email.isEmpty, !password.isEmpty else {
            DispatchQueue.main.async {
                self.errorMessage = "Email and password cannot be empty."
            }
            return
        }
        
//        guard isValidEmail(email) else {
//            DispatchQueue.main.async {
//                self.errorMessage = "Email doesn't match a valid format."
//            }
//            return
//        }
        
//        guard password.count >= 6 else {
//            DispatchQueue.main.async {
//                self.errorMessage = "Password too short"
//            }
//            return
//        }
        
        do {
            let credentials: LoginDto = LoginDto(email: email, password: password)
            try await loginUseCase.execute(credentials: credentials)
            DispatchQueue.main.async {
                 self.isAuthenticated = true
                 self.errorMessage = nil
             }
        } catch _ {
            DispatchQueue.main.async {
                self.isAuthenticated = false
                self.errorMessage = "Invalid credentials."
            }
        }
    }
}
