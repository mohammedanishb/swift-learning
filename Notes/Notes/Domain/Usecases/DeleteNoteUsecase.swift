//
//  DeleteNoteUsecase.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

protocol DeleteNoteUsecaseProtocol {
    func execute(note: Note)
}

final class DeleteNoteUsecase: DeleteNoteUsecaseProtocol {
    
    private let repository: NoteRepositoryProtocol
    
    init (repository: NoteRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(note: Note) {
        repository.deleteNote(note: note)
    }
}
