//
//  ContentView.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: NotesViewModel
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: NotesViewModel(context: context))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination: VStack{
                        Text(note.title ?? "")
                        Text(note.createdAt?.formatted(date: .abbreviated, time: .shortened) ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Divider()
                        Text(note.content ?? "")
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                    }) {
                        Text(note.title ?? "")
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .navigationBarTitle("Notes")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddNoteView(viewModel: viewModel)) {
                        Text("Add")
                    }
                    
                }
            }
        }.onAppear {
            viewModel.fetchAllNotes()
        }
    }
}

#Preview {
    HomeView(context: PersistenceController.shared.container.viewContext)
}
