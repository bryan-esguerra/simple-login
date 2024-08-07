//
//  LoginView.swift
//  sampleLogin
//
//  Created by Robert Bryan Esguerra on 7/8/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2)
                        .padding()
                } else {
                    TextField("Username", text: $viewModel.username)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)

                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)

                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                    }

                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 20)
                    }
                }
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                WelcomeView(viewModel: WelcomeViewModel(firstName: viewModel.user?.firstName ?? "",
                                                        lastName: viewModel.user?.lastName ?? ""))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
