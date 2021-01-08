//
//  Weapons.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 19/11/2020.
//

import Foundation
class Weapon {
    let damage : Int
    let type : String
    let name : String
 
    init(damage: Int, type: String, name: String) {
        self.damage = damage
        self.type = type
        self.name = name 
        
    }
    
}

