//
//  sampleLoginApp.swift
//  sampleLogin
//
//  Created by Robert Bryan Esguerra on 7/8/24.
//

import SwiftUI

@main
struct sampleLoginApp: App {
    let loginService = LoginService()
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel(loginService: loginService))
        }
    }
}
