//
//  Character.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 19/11/2020.
//

import Foundation

class Character {
    
    // MARK: - Properties
    
    let type : String
    let name : String
    var lifepoints : Int
    var weapon : Weapon
    
    // MARK: - Initializer
    
    init(type: String, name: String, lifepoints: Int, weapon: Weapon) {
        self.type = type
        self.name = name
        self.lifepoints = lifepoints
        self.weapon = weapon
    }
    // the attack function will allow you to attack the character if his life is greater than zero otherwise he will not be able to attack
    // MARK: - Functions
    func attack(target:Character) {
        if lifepoints > 0 {
            if target.lifepoints > 0 {
                target.lifepoints -= weapon.damage
                print("")
                print(name + " hit " + target.name + " and deal \(weapon.damage) damages !")
                if target.lifepoints <= 0 {
                    target.lifepoints = 0
                    print(target.name + " is dead...")
                }
            } else {
                print("")
                print("The target is already dead")
            }
        } else {
            print("")
            print(name + " can't attack: he is dead...!")
        }
    }
}
