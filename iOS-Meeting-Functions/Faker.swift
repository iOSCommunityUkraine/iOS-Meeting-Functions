//
//  File.swift
//  iOSmeetup
//
//  Created by bbb on 11/28/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import Foundation

final class Faker {
    static let shared = Faker()
    private init() {
        
    }
    
    private let stringColors = ["black",
                                "choco",
                                "green",
                                "indigo",
                                "magenta",
                                "orange",
                                "pink",
                                "potato",
                                "purple",
                                "skyblue",
                                "white",
                                "yellow"]
    private let names = ["Nubia",
                         "Virgil",
                         "Elwanda",
                         "Jennifer",
                         "Chaya",
                         "Rowena",
                         "Clarissa",
                         "Norah",
                         "Vickie",
                         "Eveline",
                         "Tricia",
                         "Juliet",
                         "Lamonica",
                         "Rafaela",
                         "Margeret",
                         "Mickey",
                         "Roseann",
                         "Daniella",
                         "Nadia",
                         "Traci",
                         "Lauryn",
                         "Annette",
                         "Esta",
                         "Moriah",
                         "Marshall",
                         "Leonora",
                         "Kathy",
                         "Wendy",
                         "Julie",
                         "Corrine",
                         "Charisse",
                         "Daine",
                         "Carie",
                         "Laveta",
                         "Denise",
                         "Claude",
                         "Danae",
                         "Arvilla",
                         "Delois",
                         "Lance",
                         "Eusebia",
                         "Orval",
                         "Vito",
                         "Parker",
                         "Coretta",
                         "Dede",
                         "Lawand",
                         "Mirella",
                         "Staciav",
                         "Donnie"]
    
    func getRandomName() -> String {
        return self.names.randomElement()!
    }
    
    func getRandomStringColor() -> String {
        return self.stringColors.randomElement()!
    }
    
    func generateUniqueId() -> String {
        return "4"
    }
    
    func f(a: String, b: String) -> String {
        return ""
    }
}

final class DataBaseManager {
    static let shared = DataBaseManager()
    private init() {}
    
    func getUserName(id: String) -> String {
        return Faker.shared.getRandomName()
    }
    
    func checkIfIdUnique(id: String) -> Bool {
        return false
    }
    
    func saveUser(_ user: User) {
        
    }
}
