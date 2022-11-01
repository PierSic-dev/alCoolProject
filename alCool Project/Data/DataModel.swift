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

class Story: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name, tokens, enigmas
    }
    
    @Published var name: String
    @Published var tokens: Int
    @Published var enigmas = [Enigma]()
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(tokens, forKey: .tokens)
        try container.encode(enigmas, forKey: .enigmas)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        tokens = try container.decode(Int.self, forKey: .tokens)
        enigmas = try container.decode([Enigma].self, forKey: .enigmas)
    }

    init(name: String, tokens: Int) {
        self.name = name
        self.tokens = tokens
        enigmas = []
    }

}

class Stories: ObservableObject {
    @Published var storiesList = [Story]()
}


/* -------------------
Vecchio codice conservato come copia di sicurezza
 
class Story: ObservableObject {
    @Published var name: String
    @Published var tokens: Int
    @Published var enigmas = [Enigma]() /*{
        didSet {
            if let encoded = try? JSONEncoder().encode(enigmas) {
                UserDefaults.standard.set(encoded, forKey: "Enigmas")
            }
        }
    } */
    
    init(name: String, tokens: Int) {
        self.name = name
        self.tokens = tokens
        if let savedEnigmas = UserDefaults.standard.data(forKey: name) {
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
*/
