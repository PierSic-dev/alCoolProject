//
//  PlayView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 01/11/22.
//

import SwiftUI

struct PlayView: View {
    var story: Story
    @State private var usedTokens = 0
    @State private var pressedHint = false
    
    var body: some View {
        NavigationStack {
            if let data = story.enigmas.first!.image, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (300), height: (200))
                    .cornerRadius(10)
                    .padding(20)
            }
            Form {
                Section {
                    Text(story.enigmas.first!.riddle)
                        .frame(height: 100, alignment: .topLeading)
                } header: {
                    Text("Riddle")
                }
                Section {
                    Text(story.enigmas.first!.hint)
                        .blur(radius: pressedHint ? 0 : 10)
                } header: {
                    Text("Hint")
                } footer: {
                    Text("Available Tokens: \(story.tokens - usedTokens)")
                }
                Section {
                    Text(story.enigmas.first!.solution)
                } header: {
                    Text("Solution")
                }
            }
            // navigation toolbar
            .toolbar {
                ToolbarItem(
                    placement: .navigationBarLeading
                ){
                    Button {
                        print("Quit")
                    } label: {
                        Image(systemName: "door.right.hand.open")
                            .foregroundColor(.accentColor)
                    }
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                }
            }
            // bottom toolbar
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        print("show hint")
                        usedTokens += 1
                        pressedHint = true
                    } label: {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.accentColor)
                    }
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                    .disabled(pressedHint || usedTokens >= story.tokens)
                    Button {
                        print("next step")
                    } label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.accentColor)
                    }
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                }
            }
            .navigationTitle(story.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(
            story: Story(
                name: "Test Story",
                tokens: 1,
                enigmas: [
                    Enigma(
                        image: Data(),
                        name: "Test Enigma 1",
                        riddle: "Riddle 1",
                        hint: "Hint 1",
                        solution: "Solution 1"
                    )
                ]
            )
        )
        .preferredColorScheme(.dark)
    }
}
