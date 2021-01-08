//
//  Players.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 19/11/2020.
//

import Foundation

class Player {
    var characters: [Character] = []
    var teamNumber = 3
   static var uniqueNames: [String] = []
    init() {
        createCharacters()
    }
    
    func createCharacter() -> Character? {
        //créer un personnage en demadant le nom a l'utilisateur
        // le choix du personnages ce vera par l'utilisitateur
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
            
            let paladin = Paladins (name: uniqueName())
            print (paladin.name, paladin.weapon, paladin.weapon.damage)
            return paladin
            
        case 2 :
            
            let thief = Thief (name: uniqueName())
            print (thief.name, thief.weapon, thief.weapon.damage)
            return thief
            
        case 3 :
            
            let warlock = Warlock (name: uniqueName())
            print (warlock.name, warlock.weapon, warlock.weapon.damage )
            return warlock
            
        case 4 :
            
            let bloodelf = BloodElf (name: uniqueName())
            print (bloodelf.name, bloodelf.weapon, bloodelf.weapon.damage)
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
            print("\(index + 1) : \(character.name) , \(character.lifepoints) , \(character.type) ")
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



