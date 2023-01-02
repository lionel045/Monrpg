//
//  Caracters.swift
//  Orienté objet
//
//  Created by Lion on 06/12/2022.
//

import Foundation

protocol Character {  // Define a protocol for the caracters for protect the mistake and create an model
    var name: String { get }
    var weapon: Weapon? { get set }
    var live: Int { get set }
    var chanceForMakeCriticalDamage: Int {get}
    func attack(ennemy: inout Character)
    init() // Possibility for users to choose in initialision the wheapons
}
extension Character {
    func attack(ennemy: inout Character) {
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
}
