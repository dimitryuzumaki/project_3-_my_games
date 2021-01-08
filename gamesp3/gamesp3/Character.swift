//
//  Character.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 19/11/2020.
//

import Foundation
class Character {
    let type : String
    let name : String
    var lifepoints : Int
    var weapon : Weapon
   
    
    init(type: String, name: String, lifepoints: Int, weapon: Weapon) {
        self.type = type
        self.name = name
        self.lifepoints = lifepoints
        self.weapon = weapon
        
    }

    func attack (target:Character){
        target.lifepoints -= weapon.damage
        print("\(name) inflige \(weapon.damage) point de dégats a \(target.name)")
    }

}
