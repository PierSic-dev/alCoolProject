//
//  DetailedStoryView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 01/11/22.
//

import SwiftUI

struct DetailedStoryView: View {
    var story: Story
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text(story.name)
                } header: {
                    Text("Name")
                }
                Section {
                    Text(String(story.tokens))
                } header: {
                    Text("Tokens")
                }
                List {
                    ForEach(story.enigmas) { enigma in
                        NavigationLink(destination: DetailedEnigmaView(enigma: enigma)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(enigma.name)
                                        .font(.headline)
                                    Text(enigma.solution)
                                }
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            // bottom toolbar
            .toolbar {
                ToolbarItem(
                    placement: .bottomBar
                ){
                    Button {
                        print("ciao")
                    } label: {
                        Text("Play")
                            .bold()
                            .foregroundColor(.accentColor)
                            .scaledToFit()
                            .frame(width: 45, height: 45, alignment: .center)
                    }
                }
            }
        }
        .navigationBarTitle(
            story.name,
            displayMode: .inline
        )
    }
    
    func removeItems(at offsets: IndexSet) {
        story.enigmas.remove(atOffsets: offsets)
    }
}

struct DetailedStoryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedStoryView(story: Story(name: "Test Story", tokens: 3)).preferredColorScheme(.dark)
    }
}
