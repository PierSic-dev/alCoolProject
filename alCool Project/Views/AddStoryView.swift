//
//  AddStoryView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 24/10/22.
//

import SwiftUI

struct AddStoryView: View {
    @Environment(\.dismiss) var dismiss
    
    let accentColor = Color(.systemPurple)
    @State private var storyName = ""
    @State private var tokens = 0
    
    var body: some View {
        NavigationStack {
            Spacer(minLength: 30.0)
            Form {
                TextField("Name", text: $storyName)
                //Stepper(value: $tokens, in: 0...5, step: 1, label: <#T##() -> _#>)
                // Test
            }
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
                "Add Story",
                displayMode: .inline
            )
        }
    }
}

struct AddStoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoryView()
    }
}
