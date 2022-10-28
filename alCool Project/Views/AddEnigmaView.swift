//
//  AddEnigmaView.swift
//  alCool Project
//
//  Created by Pierpaolo Siciliano on 23/10/22.
//

import SwiftUI
import PhotosUI

struct AddEnigmaView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var selectedPhoto: [PhotosPickerItem] = []
    @State var data: Data?
    
    // Enigma text data
    @State private var enigmaName = ""
    @State private var enigmaRiddle = ""
    @State private var enigmaHint = ""
    @State private var enigmaSolution = ""
    
    var body: some View {
        NavigationStack {
            PhotosPicker(
                selection: $selectedPhoto,
                maxSelectionCount: 1,
                matching: .images
            ) {
                ZStack {
                    
                    if selectedPhoto.isEmpty {
                        RoundedRectangle(cornerRadius: 10)
                            .padding(20)
                            .foregroundColor(Color(UIColor.secondarySystemBackground))
                            .frame(width: (300), height: (200))
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45, alignment: .center)
                            .foregroundColor(.accentColor)
                    } else {
                        if let data = data, let image = UIImage(data: data) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: (300), height: (200))
                                .cornerRadius(10)
                                .padding(20)
                        }
                    }
                        
                }
            }
            .onChange(of: selectedPhoto) { newValue in
                guard let item = selectedPhoto.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else {
                            print("Data is nil")
                        }
                    case .failure(let failure):
                        print(failure)
                        fatalError()
                    }
                }
            }
            /*
             .onChange(of: selectedItem) { newValue in
                             guard let item = selectedItem.first else {
                                 return
                             }
                             item.loadTransferable(type: Data.self) { result in
                                 switch result {
                                 case .success(let data):
                                     if let data = data {
                                         self.data = data
                                     }
                                 case .failure(let failure):
                                     print("Error: \(failure.localizedDescription)")
                                 }
                             }
                         }
             */
            Form {
                Section {
                    TextField("", text: $enigmaName)
                } header: {
                    Text("Name")
                }
                Section {
                    TextEditor(text: $enigmaRiddle)
                        .frame(height: 100)
                } header: {
                    Text("Riddle")
                }
                Section {
                    TextField("", text: $enigmaHint)
                } header: {
                    Text("Hint")
                }
                Section {
                    TextField("", text: $enigmaSolution)
                } header: {
                    Text("Solution")
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
                            .foregroundColor(.accentColor)
                    }
                }
                ToolbarItem(
                    placement: .navigationBarLeading
                ){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.accentColor)
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
        AddEnigmaView().colorScheme(.dark)
    }
}
