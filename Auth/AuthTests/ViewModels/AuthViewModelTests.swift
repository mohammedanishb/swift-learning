//
//  AuthViewModelTests.swift
//  AuthTests
//
//  Created by Mohammed Anish B on 30/05/25.
//

import XCTest
import Combine

@testable import Auth

final class AuthViewModelTests: XCTestCase {
    
    var vm: AuthViewModel?
    
    let username = "test@test.com"
    let password = "123456"
    let repeatPassword = "123456"
    let dob = Date()
    let gender: String = "Male"
    let fullName: String = "test"
    
    var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        vm = AuthViewModel()
    }
    
    override func tearDownWithError() throws {
       vm = nil
    }
    
    func test_isLoggedIn_shouldLogin() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$isLoggedIn.dropFirst().sink { (isLoggedIn) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: repeatPassword, dob: dob, gender: gender, fullName: fullName)
        
        vm?.login(username: vm?.username, password: vm?.password)
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue((vm?.isLoggedIn) == true)
    }
    
    func test_isLoggedIn_shouldNotLogin() {let expectation = XCTestExpectation(description: "Waiting for login")
        vm?.$isLoggedIn.dropFirst().sink { (isLoggedIn) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: repeatPassword, dob: dob, gender: gender, fullName: fullName)
        
        vm?.login(username: UUID().uuidString, password: UUID().uuidString)
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue((vm?.isLoggedIn) == false)
    }
    
    func test_isLoggedIn_nilValueShouldNotLogin() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$isLoggedIn.dropFirst().sink { (isLoggedIn) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: repeatPassword, dob: dob, gender: gender, fullName: fullName)
        
        vm?.login(username: nil, password: nil)
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue((vm?.isLoggedIn) == false)
    }
    
    func test_register_shouldRegister() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$isRegistered.dropFirst().sink { (isLoggedIn) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: repeatPassword, dob: dob, gender: gender, fullName: fullName)
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(username == vm?.username)
        XCTAssertTrue(password == vm?.password)
        XCTAssertTrue(repeatPassword == vm?.repeatPassword)
        XCTAssertTrue(repeatPassword == password)
        XCTAssertTrue(dob == vm?.dob)
        XCTAssertTrue(gender == vm?.gender)
        XCTAssertTrue(fullName == vm?.fullName)
        XCTAssertTrue((vm?.isRegistered) == true)
        
    }
    
    func test_register_emptyUsernameShouldCreateError() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$usernameErrMsg.dropFirst().sink { (errMsg) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: "", password: password, repeatPassword: repeatPassword, dob: dob, gender: gender, fullName: fullName)
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(vm?.usernameErrMsg?.isEmpty == false)
        XCTAssertTrue((vm?.isRegistered) == false)
        
    }
    
    func test_register_emptyPasswordShouldCreateError() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$passwordErrMsg.dropFirst().sink { (errMsg) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: "", repeatPassword: repeatPassword, dob: dob, gender: gender, fullName: fullName)
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(vm?.passwordErrMsg?.isEmpty == false)
        XCTAssertTrue((vm?.isRegistered) == false)
    }
    
    func test_register_passwordsDontMatchShouldCreateError() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$repeatPasswordErrMsg.dropFirst().sink { (errMsg) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: "wrongPassword", dob: dob, gender: gender, fullName: fullName)
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(vm?.repeatPasswordErrMsg?.isEmpty == false)
        XCTAssertTrue((vm?.isRegistered) == false)
    }
    
    func test_register_emptyRepeatPasswordShouldCreateError() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$repeatPasswordErrMsg.dropFirst().sink { (errMsg) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: "", dob: dob, gender: gender, fullName: fullName)
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(vm?.repeatPasswordErrMsg?.isEmpty == false)
        XCTAssertTrue((vm?.isRegistered) == false)
    }
    
    func test_register_emptyGenderShouldCreateError() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$genderErrMsg.dropFirst().sink { (errMsg) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: repeatPassword, dob: dob, gender: "", fullName: fullName)
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(vm?.genderErrMsg?.isEmpty == false)
        XCTAssertTrue((vm?.isRegistered) == false)
    }
    
    func test_register_emptyFullNameShouldCreateError() {
        let expectation = XCTestExpectation(description: "Waiting for login")
        
        vm?.$fullNameErrMsg.dropFirst().sink { (errMsg) in
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        vm?.register(username: username, password: password, repeatPassword: repeatPassword, dob: dob, gender: gender, fullName: "")
        
        wait(for: [expectation], timeout: 3)
        
        XCTAssertTrue(vm?.fullNameErrMsg?.isEmpty == false)
        XCTAssertTrue((vm?.isRegistered) == false)
    }
    
}
