//
//  AddEnigmaView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 23/10/22.
//

import SwiftUI

struct AddEnigmaView: View {
    @Environment(\.dismiss) var dismiss
    
    let accentColor = Color(.systemPurple)
    
    var body: some View {
        NavigationStack {
            Text("Add an Enigma here")
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
                                .foregroundColor(accentColor)
                        }
                    }
                    ToolbarItem(
                        placement: .navigationBarLeading
                    ){
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(accentColor)
                        }
                    }
                }
                .navigationBarTitle(
                    "Add Enigma",
                    displayMode: .inline
                )
        }
    }
}

struct AddEnigmaView_Previews: PreviewProvider {
    static var previews: some View {
        AddEnigmaView()
    }
}
