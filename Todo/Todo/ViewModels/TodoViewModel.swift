//
//  TodoViewModel.swift
//  Todo
//
//  Created by Mohammed Anish B on 27/05/25.
//

import Foundation
import Combine

class TodoViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    @Published var newToDo: String = ""
    
    func addTodo() {
        guard !newToDo.isEmpty else { return }
        todos.append(Todo(text: newToDo, isCompleted: false))
        newToDo = ""
    }
    
    func removeTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    func toggleCompletion(for todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
    
}
