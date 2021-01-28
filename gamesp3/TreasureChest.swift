//
//  TreasureChest.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 07/01/2021.
//

import Foundation
//this vas class allows to display the random chest which will be defined by a random number ranging from 1 to 3 and to give a powerful weapon to the user
class TreasureChest {
    
    // MARK: - Functions
    
    static func open(character: Character) {
        let randomNumber: Int = .random(in: 0 ... 3)
        if randomNumber == 2 {
            print("Le coffre magique apparait ! 🎁")
            print("\(character.name) s'équipe de l'Epic Weapon ! ⚔️")
            character.weapon = EpicWeapon()
        }
    }
}

class EpicWeapon: Weapon {
    
    // MARK: - Initializer
    
    init () {
        super.init(damage: 200)
    }
}
