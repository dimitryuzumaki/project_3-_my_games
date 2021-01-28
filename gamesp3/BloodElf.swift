//
//  BloodElf.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 04/12/2020.
//

import Foundation

class BloodElf: Character {
    
    // MARK: - Initializer
    
    init(name: String) {
        super.init(type: "Tank", name: name , lifepoints: 180 , weapon: Dagger())
    }
}

