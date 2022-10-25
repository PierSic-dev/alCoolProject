//
//  ContentView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 22/10/22.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") {
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    @State private var isShowed = false
    
    var body: some View {
        Button("Present!") {
            isShowed.toggle()
        }
        .fullScreenCover(isPresented: $isShowed, content: FullScreenModalView.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
