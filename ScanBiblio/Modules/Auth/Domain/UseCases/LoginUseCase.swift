import Foundation

class LoginUseCase {
    var authRepository: AuthRepositoryProtocol
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    func execute(credentials: LoginDto) async throws -> Void {
        try await authRepository.login(credentials: credentials)
    }
}
