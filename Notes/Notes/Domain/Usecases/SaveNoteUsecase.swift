//
//  SaveNoteUsecase.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

import Foundation

protocol SaveNoteUsecaseProtocol {
    func execute(title: String, content: String, date: Date)
}

final class SaveNoteUsecase: SaveNoteUsecaseProtocol {
    
    private let repository: NoteRepositoryProtocol
    
    init (repository: NoteRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(title: String, content: String, date: Date) {
        repository.saveNote(title: title, content: content, date: date)
    }
}
