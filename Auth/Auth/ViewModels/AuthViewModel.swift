//
//  AuthViewModel.swift
//  Auth
//
//  Created by Mohammed Anish B on 30/05/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    @Published var isRegistered: Bool = false
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    @Published var dob: Date = Date()
    @Published var gender: String = "Male"
    @Published var fullName: String = ""
    
    @Published var usernameErrMsg: String?
    @Published var passwordErrMsg: String?
    @Published var repeatPasswordErrMsg: String?
    @Published var dobErrMsg: String?
    @Published var genderErrMsg: String?
    @Published var fullNameErrMsg: String?
    
    func login(username: String?, password: String?) {
        if username == nil || password == nil {
            isLoggedIn = false
            return
        } else {
            isLoggedIn = username == self.username && password == self.password
        }
    }
    
    func register(username: String, password: String, repeatPassword: String, dob: Date, gender: String, fullName: String) {
        if username.isEmpty {
            usernameErrMsg = "Username is required"
            return
        } else {
            usernameErrMsg = nil
        }
        
        if password.isEmpty {
            passwordErrMsg = "Password is required"
            return
        } else {
            if password != repeatPassword {
                repeatPasswordErrMsg = "Passwords do not match"
                return
            } else {
                repeatPasswordErrMsg = nil
                passwordErrMsg = nil
            }
        }
        
        if dob == Date() {
            dobErrMsg = "Date of birth is required"
            return
        } else {
            dobErrMsg = nil
        }
        
        if gender.isEmpty {
            genderErrMsg = "Gender is required"
            return
        } else {
            genderErrMsg = nil
        }
        
        if fullName.isEmpty {
            fullNameErrMsg = "Full name is required"
            return
        } else {
            fullNameErrMsg = nil
        }
        
        self.username = username
        self.password = password
        self.repeatPassword = repeatPassword
        self.dob = dob
        self.gender = gender
        self.fullName = fullName
        isRegistered = true
    }
    
}
