//
//  StoriesView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 22/10/22.
//

import SwiftUI

struct StoriesView: View {
    @StateObject var stories = Stories()
    
    @Binding var shouldShowOnboarding: Bool
    @Binding var skipButton: Bool
    
    @State private var showingAddStoryModal = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                content()
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
                                shouldShowOnboarding.toggle()
                                skipButton.toggle()
                            } label: {
                                Image(systemName: "questionmark")
                                    .foregroundColor(.accentColor)
                            }
                            .scaledToFit()
                            .frame(width: 45, height: 45, alignment: .center)
                        }
                    }
                    .navigationTitle("Stories")
            }
        }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            Onboarding(shouldShowOnboarding: $shouldShowOnboarding, skipButton: $skipButton)
        } )
    }
    
    func removeStory(at offsets: IndexSet) {
        stories.storiesList.remove(atOffsets: offsets)
    }
    
    @ViewBuilder func content() -> some View {
        if stories.storiesList.isEmpty {
            VStack {
                Text("There are no Stories...\nYet!")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
        } else {
            List {
                ForEach(stories.storiesList) { story in
                    NavigationLink(destination: DetailedStoryView(story: story)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(story.name)
                                    .font(.headline)
                                Text(story.tokens, format: .number)
                            }
                        }
                    }
                }
                .onDelete(perform: removeStory)
            }
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView(stories: Stories(), shouldShowOnboarding: .constant(false), skipButton: .constant(false)).colorScheme(.dark)
    }
}
