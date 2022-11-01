//
//  PlayView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 01/11/22.
//

import SwiftUI

struct PlayView: View {
    @Environment(\.dismiss) var dismiss
    
    var story: Story
    
    @State private var usedTokens = 0
    @State private var pressedHint = false
    @State private var showRiddle = false
    @State private var showSolution = false
    @State private var currentEnigma = 0
    
    @State private var victoryScreen = false
    
    var body: some View {
        NavigationStack {
            if let data = story.enigmas[currentEnigma].image, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (300), height: (200))
                    .cornerRadius(10)
                    .padding(20)
            }
            Form {
                Section {
                    Text(story.enigmas[currentEnigma].riddle)
                        .blur(radius: showRiddle ? 0 : 10)
                        .frame(height: 100, alignment: .topLeading)
                } header: {
                    Text("Riddle")
                }
                Section {
                    Text(story.enigmas[currentEnigma].hint)
                        .blur(radius: pressedHint ? 0 : 10)
                } header: {
                    Text("Hint")
                } footer: {
                    Text("Available Tokens: \(story.tokens - usedTokens)")
                }
                Section {
                    Text(story.enigmas[currentEnigma].solution)
                        .blur(radius: showSolution ? 0 : 10)
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
                        
                        dismiss()
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
                        if (!showRiddle) {
                            showRiddle = true
                        } else if (showRiddle && !showSolution) {
                            showSolution = true
                        } else if (currentEnigma < (story.enigmas.count - 1)) {
                            currentEnigma += 1
                            showRiddle = false
                            showSolution = false
                            pressedHint = false
                        } else {
                            print("Hai vinto")
                            
                            victoryScreen = true
                        }
                    } label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.accentColor)
                    }
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                    .fullScreenCover(
                        isPresented: $victoryScreen
                    ){
                        VictoryView()
                    }
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
