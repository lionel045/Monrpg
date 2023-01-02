//
//  Assasin.swift
//  Orienté objet
//
//  Created by Lion on 12/12/2022.
//
import Foundation

class Assassin: Character {
    var weapon: Weapon?
    var name: String
    var live: Int
    var dammage = Dammage()
    var chanceForMakeCriticalDamage = 2
    required init() {
        self.name = "Ezio"
        self.live = 20
    }
}
