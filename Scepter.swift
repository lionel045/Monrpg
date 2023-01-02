//
//  Scepter.swift
//  Monrpg
//
//  Created by Lion on 30/12/2022.
//

import Foundation

class Scepter: Weapon {
    var dammage = Dammage()
    var name = "Sceptre de la destiné"
    required init() {
        self.dammage.numberofDammage = 50
    }
}
