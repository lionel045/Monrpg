//
//  Dague.swift
//  Monrpg
//
//  Created by Lion on 29/12/2022.
//

import Foundation

class Dagger: Weapon {
    var dammage = Dammage()
    var name = "Dague Magique"
    required init() {
        self.dammage.numberofDammage = 40
    }
}
