//
//  LoginViewModel.swift
//  sampleLogin
//
//  Created by Robert Bryan Esguerra on 7/8/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    var loginService: LoginAPIService?

    init(loginService: LoginAPIService? = nil) {
        self.loginService = loginService
    }

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var user: User?
    @Published var isLoggedIn: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func login() {
        isLoading = true
        errorMessage = nil
        
        loginService?.login(userName: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(user):
                    self?.clear()
                    self?.user = user
                    self?.isLoggedIn = true
                case .failure(_):
                    self?.errorMessage = "Invalid username or password."
                }
                self?.isLoading = false
            }
        }
    }

    private func clear() {
        username = ""
        password = ""
    }
}
