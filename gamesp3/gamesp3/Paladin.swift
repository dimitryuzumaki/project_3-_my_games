//
//  Paladin.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 07/12/2020.
//

import Foundation
class Paladins : Character {
    
    init (name: String) {
        super.init(type: "Healer" , name: name , lifepoints: 200 , weapon: MagicWant())
    }
    func care(target:Character) {
        target.lifepoints += weapon.damage
        print ("\(name)\"soigne l'équipe de + 10 pv")
        
        
        
        
    }
    
}
