//
//  Elfe.swift
//  Orienté objet
//
//  Created by Lion on 06/12/2022.
//

import Foundation

class Elfe: Caracter {
    var weapon: Weapon?
    // Elfe's Caracters, This caracters start the game with more live than other caracters
    var name: String
    var live: Int
    var dammage =  Dammage()
    var chanceForMakeCriticalDamage =  2
    required init() {
        self.name = "Elfe"
        self.live = 20
    }
}
