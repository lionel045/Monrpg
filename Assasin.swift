//
//  Assasin.swift
//  Orienté objet
//
//  Created by Lion on 12/12/2022.
//
import Foundation
class Killer: Caracters {
    var weapon: Weapon?
    func getlive() -> Int {
        return live
    }
    // He's stronger when is wear an wheapon
    var name: String
    var live: Int
    var dammage = Dammage()
    var chanceForMakeCriticalDamage = 2
    func isAlive() -> Bool {
        if self.live <= 0 {
            print("Votre personnage est désormais Ko")
            return false
        } else {
            return true
        }
    }
    func attack(ennemy: inout Caracters) {
        //   print(self.name + " Attaque violament \(ennemy.name) et lui inflige \(self.dammage) point de degats")
        let numberOfDammage = (self.weapon?.dammage.numberofDammage) ?? 0
        let random = Int.random(in: 1...10)
        if random <= self.chanceForMakeCriticalDamage {
             let criticalStrike = numberOfDammage * 2
               print(self.name + " Attaque violament \(ennemy.name) et lui inflige un coup critique de \(criticalStrike) point de degats")
               ennemy.live -= criticalStrike
        } else {
            print(self.name + " Attaque violament \(ennemy.name) et lui inflige \(numberOfDammage) point de degats")
            ennemy.live -= numberOfDammage
        }
    }
    required init() {
        self.name = "Ezio"
        self.live = 20
    }
}