//
//  Sword.swift
//  Monrpg
//
//  Created by Lion on 30/12/2022.
//

import Foundation

class Sword: Weapon {
    var dammage = Dammage()
    var name = "Epee de la vérité"
    required init() {
        self.dammage.numberofDammage = 48
    }
}
