//
//  DetailedEnigmaView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 01/11/22.
//

import SwiftUI

struct DetailedEnigmaView: View {
    var enigma: Enigma
    
    var body: some View {
        NavigationStack {
            if let data = enigma.image, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (300), height: (200))
                    .cornerRadius(10)
                    .padding(20)
            }
            Form {
                Section {
                    Text(enigma.name)
                } header: {
                    Text("Name")
                }
                Section {
                    Text(enigma.riddle)
                        .frame(height: 100, alignment: .topLeading)
                } header: {
                    Text("Riddle")
                }
                Section {
                    Text(enigma.hint)
                } header: {
                    Text("Hint")
                }
                Section {
                    Text(enigma.solution)
                } header: {
                    Text("Solution")
                }
            }
            .navigationBarTitle(
                enigma.name,
                displayMode: .inline
            )
        }
    }
}

struct DetailedEnigmaView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedEnigmaView(enigma: Enigma(image: Data(), name: "Test Enigma", riddle: "Test Riddle", hint: "Test Hint", solution: "Test Solution")).preferredColorScheme(.dark)
    }
}
