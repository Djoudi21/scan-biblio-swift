import Foundation

protocol AuthRepositoryProtocol {
    func login(credentials: LoginDto) async throws -> Void
//    func register(credentials: RegisterDto) async throws -> Void
}
