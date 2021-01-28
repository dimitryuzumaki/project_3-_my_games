//
//  Players.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 19/11/2020.
//

import Foundation

class Player {
    
    // MARK: - Properties
    
    var characters: [Character] = []
    let teamNumber = 3
    static var uniqueNames: [String] = []
    
    // MARK: - Initializer
    
    init() {
        createCharacters()
    }
    
    // MARK: - Functions
    
    func createCharacter() -> Character? {
        print ("")
        print("Select your character :"
                + "\n1. 🧙🏻‍♂️Paladin: Healer"
                + "\n2. 🐺Thief: Dps"
                + "\n3. 👹Warlock: Distance"
                + "\n4. 🧝🏻‍♂️BloodElf: Tank")
        var userChoice = 0
        repeat {
            if  let choice = readLine() {
                if let int = Int(choice) {
                    userChoice = int
                }
            }
        } while userChoice != 1 && userChoice != 2  && userChoice != 3  && userChoice != 4
        switch userChoice {
        case 1 :
            let paladin = Paladin (name: uniqueName())
            return paladin
        case 2 :
            let thief = Thief (name: uniqueName())
            return thief
        case 3 :
            let warlock = Warlock (name: uniqueName())
            return warlock
        case 4 :
            let bloodelf = BloodElf (name: uniqueName())
            return bloodelf
        default: return nil
        }
    }
    
    func createCharacters() {
        for i in  0..<teamNumber {
            print("N°\(i + 1)")
            guard let character =  createCharacter() else { return  }
            characters.append(character)
        }
    }
    //the unique Name function will allow you to generate unique names which will be used by the user not to name the characters twice
    
    func uniqueName() -> String {
        var uniqueName = ""
        print("Enter the character Name 😋:")
        repeat {
            if let choice = readLine() {
                uniqueName = choice
                if Player.uniqueNames.contains(uniqueName) {
                    print ("this name is already taken")
                    uniqueName =  ""
                } else {
                    Player.uniqueNames.append(uniqueName)
                }
            }
        } while uniqueName == ""
        return uniqueName
    }
    
    func playerCharacter() {
        characters.enumerated().forEach { (index, character) in
            print("\(index + 1) : Nom: \(character.name) | PV: \(character.lifepoints) | Type: \(character.type) | Dégats: \(character.weapon.damage)")
        }
    }
    
    func isDead() -> Bool {
        var isDead = false
        for character in characters {
            if character.lifepoints <= 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
    }
}
