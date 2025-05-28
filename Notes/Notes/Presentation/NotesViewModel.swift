//
//  NotesViewModel.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

import Foundation
import SwiftUICore
import CoreData

class NotesViewModel: ObservableObject {
    
    @Published var notes: [Note] = []
    
    private let fetchAllNotesUsecase: FetchAllNotesUsecaseProtocol
    private let saveNoteUsecase: SaveNoteUsecaseProtocol
    private let deleteNoteUsecase: DeleteNoteUsecaseProtocol
    
    init(context: NSManagedObjectContext) {
        let repository = NoteRepository(context: context)
        self.fetchAllNotesUsecase = FetchAllNotesUsecase(repository: repository)
        self.saveNoteUsecase = SaveNoteUsecase(repository: repository)
        self.deleteNoteUsecase = DeleteNoteUsecase(repository: repository)
    }
    
    func fetchAllNotes() {
       notes = fetchAllNotesUsecase.execute()
    }
    
    func saveNote(text: String, content: String, date: Date) {
        saveNoteUsecase.execute(title: text, content: content, date: date)
        fetchAllNotes()
    }
    
    func deleteNote(at offsets: IndexSet) {
        let note = notes[offsets.first!]
        deleteNoteUsecase.execute(note: note)
        fetchAllNotes()
    }
    
}
