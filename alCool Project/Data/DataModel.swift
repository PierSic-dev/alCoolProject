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

class Story: ObservableObject, Codable, Identifiable {
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

class Stories: ObservableObject, Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case storiesList
    }
    
    @Published var storiesList = [Story]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(storiesList) {
                UserDefaults.standard.set(encoded, forKey: "savedStories")
                print("encoding ok")
            } else {
                print("encoding fallito")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "savedStories") {
            if let decoded = try? JSONDecoder().decode([Story].self, from: data) {
                storiesList = decoded
                return
            }
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(storiesList, forKey: .storiesList)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        storiesList = try container.decode([Story].self, forKey: .storiesList)
    }
}
