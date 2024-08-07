//
//  sampleLoginTests.swift
//  sampleLoginTests
//
//  Created by Robert Bryan Esguerra on 7/8/24.
//

import XCTest
@testable import sampleLogin

class LoginViewModelTests: XCTestCase {

    func testLoginWithValidCredentials() async {
        let loginService = LoginService()
        let viewModel = LoginViewModel(loginService: loginService)
        viewModel.username = "bryan"
        viewModel.password = "password"

        let expectation = XCTestExpectation(description: "Login should succeed")

        viewModel.login()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            XCTAssertTrue(viewModel.isLoggedIn, "User should be logged in with valid credentials")
            XCTAssertEqual(viewModel.user?.firstName, "Robert Bryan", "First name should be Robert Bryan")
            XCTAssertEqual(viewModel.user?.lastName, "Esguerra", "Last name should be Esguerra")
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 3)
    }

    func testLoginWithInvalidCredentials() async {
        let loginService = LoginService()
        let viewModel = LoginViewModel(loginService: loginService)
        viewModel.username = "wrongUser"
        viewModel.password = "wrongPassword"

        let expectation = XCTestExpectation(description: "Login should fail")

        viewModel.login()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            XCTAssertFalse(viewModel.isLoggedIn, "User should not be logged in with invalid credentials")
            XCTAssertNotNil(viewModel.errorMessage, "An error message should be shown")
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 3)
    }

    func testLoginWithEmptyCredentials() async {
        let loginService = LoginService()
        let viewModel = LoginViewModel(loginService: loginService)
        viewModel.username = ""
        viewModel.password = ""

        let expectation = XCTestExpectation(description: "Login should fail")

        viewModel.login()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            XCTAssertFalse(viewModel.isLoggedIn, "User should not be logged in with empty credentials")
            XCTAssertNotNil(viewModel.errorMessage, "An error message should be shown")
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 3)
    }
}
