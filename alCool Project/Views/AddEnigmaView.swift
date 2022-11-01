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
    @ObservedObject var story: Story
    
    @State private var selectedPhoto: [PhotosPickerItem] = []
    @State private var imageData: Data?
    @State private var name = ""
    @State private var riddle = ""
    @State private var hint = ""
    @State private var solution = ""
    
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
                        if let data = imageData, let image = UIImage(data: data) {
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
                            self.imageData = data
                        } else {
                            print("Data is nil")
                        }
                    case .failure(let failure):
                        print(failure)
                        fatalError()
                    }
                }
            }
            Form {
                Section {
                    TextField("", text: $name)
                } header: {
                    Text("Name")
                }
                Section {
                    TextEditor(text: $riddle)
                        .frame(height: 100)
                } header: {
                    Text("Riddle")
                }
                Section {
                    TextField("", text: $hint)
                } header: {
                    Text("Hint")
                }
                Section {
                    TextField("", text: $solution)
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
                        let enigma = Enigma(image: imageData!, name: name, riddle: riddle, hint: hint, solution: solution)
                        story.enigmas.append(enigma)
                        
                        dismiss()
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
        AddEnigmaView(story: Story(name: "", tokens: 0)).colorScheme(.dark)
    }
}
