//
//  AddEnigmaView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 23/10/22.
//

import SwiftUI
import PhotosUI

struct AddEnigmaView: View {
    let accentColor = Color(.systemPurple)
    
    @Environment(\.dismiss) var dismiss
    
    @State var selectedPhoto: [PhotosPickerItem] = []
    @State var data: Data?
    
    // Enigma text data
    @State private var enigmaName = ""
    @State private var enigmaRiddle = ""
    @State private var textEditorHeight: CGFloat = 100
    @State private var enigmaHint = ""
    @State private var enigmaSolution = ""
    
    var body: some View {
        NavigationStack {
            if let data = data, let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
            }
            PhotosPicker(
                selection: $selectedPhoto,
                maxSelectionCount: 1,
                matching: .images
            ) {
                RoundedRectangle(cornerRadius: 10)
                    .padding(20)
                    .foregroundColor(accentColor)
                    .frame(width: (200.0 * 2), height: (100.0 * 2))
            }
            Form {
                Section {
                    TextField("", text: $enigmaName)
                } header: {
                    Text("Name")
                }
                Section {
                    TextEditor(text: $enigmaRiddle)
                        .frame(height: textEditorHeight + 12)
                } header: {
                    Text("Riddle")
                }
                Section {
                    TextField("Hint", text: $enigmaHint)
                    TextField("Solution", text: $enigmaSolution)
                } header: {
                    Text("Hint and solution")
                }
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
