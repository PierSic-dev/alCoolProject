//
//  AddStoryView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 24/10/22.
//

import SwiftUI

struct AddStoryView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var story = Story(name: "", tokens: 0)
    @ObservedObject var stories: Stories
    
    @State private var showingAddEnigmaModal = false
    var maxTokens = 5
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $story.name)
                } header: {
                    Text("Name")
                }
                Section {
                    Stepper("\(story.tokens)", value: $story.tokens, in: 0...maxTokens)
                } header: {
                    Text("Tokens")
                }
                Section {
                    List {
                        ForEach(story.enigmas) { enigma in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(enigma.name)
                                        .font(.headline)
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                Section {
                    Button {
                        showingAddEnigmaModal.toggle()
                    } label: {
                        Text("Add Enigma")
                    }
                    .foregroundColor(.purple)
                }
            }
            .sheet(
                isPresented: $showingAddEnigmaModal
            ) {
                AddEnigmaView(story: story)
            }
            // navigation toolbar
            .toolbar {
                ToolbarItem(
                    placement: .navigationBarTrailing
                ){
                    Button {
                        stories.storiesList.append(story)
                        
                        dismiss()
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
            .navigationTitle("Add Story")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        story.enigmas.remove(atOffsets: offsets)
    }
}

struct AddStoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoryView(stories: Stories()).colorScheme(.dark)
    }
}
