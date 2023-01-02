//
//  Caracters.swift
//  Orienté objet
//
//  Created by Lion on 06/12/2022.
//

import Foundation
 protocol Caracters {  // Define a protocol for the caracters for protect the mistake and create an model
    var name: String {get }
      var weapon: Weapon? {get set}
     var live: Int {get set}
    var dammage: Dammage {get}  // Define the dammage of caracters
    // Methods
    var chanceForMakeCriticalDamage: Int {get}
    func isAlive() -> Bool // It's gonna take the value for know if one of personnage is KO
    func attack(ennemy: inout Caracters)
    init() // Possibility for users to choose in initialision the wheapons
}
