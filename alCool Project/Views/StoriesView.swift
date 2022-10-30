//
//  StoriesView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 22/10/22.
//

import SwiftUI

struct StoriesView: View {
    @StateObject var stories = Stories()
    
    @AppStorage("ShouldShowOnboarding") var ShouldShowOnboarding: Bool = true
    @AppStorage("SkipButton") var SkipButton: Bool = true
    
    @State private var showingAddStoryModal = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(stories.storiesList, id: \.name) { story in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(story.name)
                                    .font(.headline)
                                Text(story.tokens, format: .number)
                            }
                        }
                    }
                }
                /* Temporaneamente commentato - Da mostrare solo se stories.storiesList è vuoto
                VStack {
                    Text("There are no Stories...\nYet!")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                }
                */
                // navigation toolbar
                .toolbar {
                    ToolbarItem(
                        placement: .navigationBarTrailing
                    ){
                        Button {
                            showingAddStoryModal.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.accentColor)
                        }
                        .scaledToFit()
                        .frame(width: 45, height: 45, alignment: .center)
                        .sheet(
                            isPresented: $showingAddStoryModal
                        ){
                            AddStoryView(stories: stories)
                        }
                    }
                }
                // bottom toolbar
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            ShouldShowOnboarding.toggle()
                            SkipButton.toggle()
                            OnboardingView(ShouldShowOnboarding: $ShouldShowOnboarding, SkipButton: $SkipButton)
                        } label: {
                            Image(systemName: "questionmark")
                                .foregroundColor(.accentColor)
                        }
                        .scaledToFit()
                        .frame(width: 45, height: 45, alignment: .center)
                        Spacer()
                        Button {
                            print("Join")
                        } label: {
                            Text("Join")
                                .foregroundColor(.accentColor)
                        }
                        .scaledToFit()
                        .frame(width: 45, height: 45, alignment: .center)
                    }
                }
                .navigationBarTitle("Stories")
            }
        }
        .fullScreenCover(isPresented: $ShouldShowOnboarding, content: {
            OnboardingView(ShouldShowOnboarding: $ShouldShowOnboarding, SkipButton: $SkipButton)
        } )
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView().colorScheme(.dark)
    }
}
