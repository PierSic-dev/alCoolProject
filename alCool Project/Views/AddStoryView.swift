//
//  AddStoryView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 24/10/22.
//

import SwiftUI

struct AddStoryView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var storyName = ""
    @State private var tokens = 0 // Forse @State non è il property wrapper adatto se tokens deve essere disponibile in altre views
    @State private var showingAddEnigmaModal = false
    var maxTokens = 5// questo va cambiato in base al numero di enigmi nella story
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $storyName)
                Stepper("Tokens: \(tokens)", value: $tokens, in: 0...maxTokens)
            }
            Button {
                showingAddEnigmaModal.toggle()
            } label: {
                Label("Add Enigma", systemImage: "plus")
            }
            .foregroundColor(.purple)
            .sheet(
                isPresented: $showingAddEnigmaModal
            ) {
                AddEnigmaView()
            }
            
            // navigation toolbar
            .toolbar {
                ToolbarItem(
                    placement: .navigationBarTrailing
                ){
                    Button {
                        print("Done")
                    } label: {
                        Text("Done")
                            .bold()
                            .foregroundColor(.accentColor)
                    }
                }
                ToolbarItem(
                    placement: .navigationBarLeading
                ){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .navigationBarTitle(
                "Add Story",
                displayMode: .inline
            )
        }
    }
}

struct AddStoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoryView()
    }
}
