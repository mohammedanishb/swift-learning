//
//  ContentView.swift
//  Auth
//
//  Created by Mohammed Anish B on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section(header: Text("Credentials")) {
                        TextField("Email", text: $viewModel.username)
                        SecureField("Password", text: $viewModel.password)
                        SecureField("Repeat Password", text: $viewModel.repeatPassword)
                    }
                    Section(header: Text("Basic Info")) {
                        TextField("Name", text: $viewModel.fullName)
                        DatePicker("Birthdate", selection: $viewModel.dob)
                        Picker("Gender", selection: $viewModel.gender) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                    }
                    
                }
                .navigationTitle(Text("Auth"))
                
                if let error = viewModel.usernameErrMsg {
                    Text(error)
                        .foregroundColor(.red)
                        .font(Font.footnote)
                }
                if let error = viewModel.passwordErrMsg {
                    Text(error)
                        .foregroundColor(.red)
                        .font(Font.footnote)
                }
                if let error = viewModel.repeatPasswordErrMsg {
                    Text(error)
                        .foregroundColor(.red)
                        .font(Font.footnote)
                }
                if let error = viewModel.fullNameErrMsg {
                    Text(error)
                        .foregroundColor(.red)
                        .font(Font.footnote)
                }
                if let error = viewModel.dobErrMsg {
                    Text(error)
                        .foregroundColor(.red)
                        .font(Font.footnote)
                }
                if let error = viewModel.genderErrMsg {
                    Text(error)
                        .foregroundColor(.red)
                        .font(Font.footnote)
                }
                   
                
                Button("Submit") {
                    viewModel.register(username: viewModel.username, password: viewModel.password, repeatPassword: viewModel.repeatPassword, dob: viewModel.dob, gender: viewModel.gender, fullName: viewModel.fullName)
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                
                NavigationLink(destination: Text("Regsitered"), isActive: $viewModel.isRegistered) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
