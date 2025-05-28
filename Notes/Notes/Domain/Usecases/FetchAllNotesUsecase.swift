//
//  FetchAllNotesUsecase.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

protocol FetchAllNotesUsecaseProtocol {
    func execute() -> [Note]
}

final class FetchAllNotesUsecase: FetchAllNotesUsecaseProtocol {
    
    private let repository: NoteRepositoryProtocol
    
    init (repository: NoteRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> [Note] {
        return repository.fetchAllNotes()
    }
}
