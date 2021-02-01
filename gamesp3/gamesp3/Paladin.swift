//
//  Paladin.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 07/12/2020.
//

import Foundation

class Paladin : Character {
    
    // MARK: - Initializer
    
    init (name: String) {
        super.init(type: "Healer" , name: name , lifepoints: 200 , weapon: MagicWant())
    }
    //the treatment function of the paladins will allow him to heal by + 10 life points if his life is greater than zero otherwise he will not be able to heal it
    func care(target:Character) {
        if lifepoints > 0 {
            if target.lifepoints > 0 {
                target.lifepoints += weapon.damage
                print ("")
                print ("\(name)\"soigne l'équipe de + 10 pv")
                if target.lifepoints <= 0 {
                    target.lifepoints = 0
                    print (target.name + "is dead ...")
                }
            } else {
                print ("")
                print ("le personnage est déja morts 💀")
            }
        } else {
            print ("")
            print (name + "je ne peut soigner car il est déja mort ! ❌")
        }
    }
}


