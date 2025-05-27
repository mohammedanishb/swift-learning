//
//  Todo.swift
//  Todo
//
//  Created by Mohammed Anish B on 27/05/25.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var text: String
    var isCompleted: Bool
}
