//
//  Thief.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 07/12/2020.
//

import Foundation
class Thief : Character {
    init (name: String) {
        super.init(type: "Dps" , name: name , lifepoints: 150 , weapon:Sword())
    }
}

