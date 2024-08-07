//
//  LoginAPIService.swift
//  sampleLogin
//
//  Created by Robert Bryan Esguerra on 7/8/24.
//

protocol LoginAPIService {
    func login(userName: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}

enum LoginError: Error {
    case invalidCredentials
}
