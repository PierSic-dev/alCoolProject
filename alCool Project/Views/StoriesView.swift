//
//  StoriesView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 22/10/22.
//

import SwiftUI

struct StoriesView: View {
    let accentColor = Color(.systemPurple)
    
    @State private var showingAddStoryModal = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("There are no Stories...\nYet!")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                }
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
                        .sheet(
                            isPresented: $showingAddStoryModal
                        ){
                            AddStoryView()
                        }
                    }
                }
                // bottom toolbar
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            print("Info")
                        } label: {
                            Image(systemName: "questionmark")
                                .foregroundColor(.accentColor)
                                .font(.caption) //Piccolo abbastanza? Forse, bisogna vedere come gestire le dimensioni di entrambi i pulsati affinchè siano abbastanza grandi ed abbiano una touch hitbox di almeno 44px come suggerito dalla AHIG
                        }
                        Spacer()
                        Button {
                            print("Join")
                        } label: {
                            Text("Join")
                                .foregroundColor(.accentColor)
                        }
                    }
                }
                .navigationBarTitle("Stories")
            }
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
