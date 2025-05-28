//
//  AddNoteView.swift
//  Notes
//
//  Created by Mohammed Anish B on 28/05/25.
//

import SwiftUI

struct AddNoteView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var selectedDate: Date = Date()
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("", text: $title)
                    
                }
                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(height: 150)
                        .padding(.vertical, 4)
                }
                Section(header: Text("Date")) {
                    DatePicker("Select date", selection: $selectedDate, displayedComponents: [.date])
                }
            }
            .navigationTitle("New Note")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.saveNote(text: title, content: content, date: selectedDate)
                        dismiss()
                        
                    }
                }
            }
        }
        
    }
}

#Preview {
    HomeView(context: PersistenceController.shared.container.viewContext)
}
