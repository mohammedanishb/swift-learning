//
//  NotesApp.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

import SwiftUI

@main
struct NotesApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView(context: persistenceController.container.viewContext)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
