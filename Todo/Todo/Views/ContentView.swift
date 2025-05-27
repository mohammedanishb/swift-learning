//
//  ContentView.swift
//  Todo
//
//  Created by Mohammed Anish B on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TodoViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your task", text: $viewModel.newToDo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button( "Add" ) {
                    viewModel.addTodo()
                }
            }
            List {
                ForEach(viewModel.todos) { todo in
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                viewModel.toggleCompletion(for: todo)
                            }
                        Text(todo.text)
                            .strikethrough(todo.isCompleted)
                    }
                }
                .onDelete(perform: viewModel.removeTodo)
            }
            .cornerRadius(10)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
