//
//  Warlock.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 07/12/2020.
//

import Foundation

class Warlock : Character {
    
    // MARK: - Initializer
    
    init (name: String) {
        super.init(type: "Distance", name: name, lifepoints: 150, weapon: Skull())
    }
}
