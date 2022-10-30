//
//  DataModel.swift
//  alCool Project
//
//  Created by Arturo Alfani on 28/10/22.
//

import Foundation

struct Enigma: Identifiable, Codable {
    var id = UUID()
    let name: String
    let riddle: String
    let hint: String
    let solution: String
}

class Story: ObservableObject {
    @Published var name: String
    @Published var tokens: Int
    @Published var enigmas = [Enigma]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(enigmas) {
                UserDefaults.standard.set(encoded, forKey: "Enigmas")
            }
        }
    }
    
    init(name: String, tokens: Int) {
        self.name = name
        self.tokens = tokens
        if let savedEnigmas = UserDefaults.standard.data(forKey: "Enigmas") {
            if let decodedEnigmas = try? JSONDecoder().decode([Enigma].self, from: savedEnigmas) {
                enigmas = decodedEnigmas
                return
            }
        }
        enigmas = []
    }
}

class Stories: ObservableObject {
    @Published var storiesList = [Story]() /*{
        didSet {
            if let encoded = try? JSONEncoder().encode(storiesList) {
                UserDefaults.standard.set(encoded, forKey: "Stories")
            }
        }
    } Questo funziona solo se Story è conforme a Codable, cosa che richiede ulteriori passaggi */
}
