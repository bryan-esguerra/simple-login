//
//  LoginService.swift
//  sampleLogin
//
//  Created by Robert Bryan Esguerra on 7/8/24.
//

import UIKit

class LoginService : LoginAPIService {
    private let users = [
            User(id: "1", username: "bryan", password: "password", firstName: "Robert Bryan", lastName: "Esguerra"),
            User(id: "2", username: "anotherUser", password: "123456", firstName: "Jane", lastName: "Smith"),
            User(id: "3", username: "exampleUser", password: "password1", firstName: "Alice", lastName: "Johnson"),
            User(id: "4", username: "sampleUser", password: "password2", firstName: "Bob", lastName: "Williams")
        ]

    func login(userName: String, password: String, completion: @escaping (Result<User, any Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if let user = self.users.first(where: { $0.username == userName && $0.password == password }) {
                completion(.success(user))
            } else {
                completion(.failure(LoginError.invalidCredentials))
            }
        }
    }
}
