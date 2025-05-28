//
//  NoteRepository.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

import Foundation
import CoreData

protocol NoteRepositoryProtocol {
    func fetchAllNotes() -> [Note]
    func saveNote(title: String, content: String, date: Date)
    func deleteNote(note: Note)
}

final class NoteRepository: NoteRepositoryProtocol {
    
    private let context: NSManagedObjectContext
    
    init (context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchAllNotes() -> [Note] {
        return try! context.fetch(Note.fetchRequest())
    }
    
    func saveNote(title: String, content: String, date: Date) {
        let note = Note(context: context)
        note.title = title
        note.content = content
        note.createdAt = date
        
        try! self.context.save()
        
    }
    
    func deleteNote(note: Note) {
        self.context.delete(note)
        
        try! self.context.save()
    }
}
