//
//  Mage.swift
//  Orienté objet
//
//  Created by Lion on 07/12/2022.
//
import Foundation
class Mage: Caracter {

    
    var weapon: Weapon?
    var name: String
    var live: Int
    var dammage = Dammage()
    var chanceForMakeCriticalDamage =  2
    required init() {
        self.name = "Merlin"
        self.live = 30
    }
}
