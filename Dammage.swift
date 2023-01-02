//
//  Dammage.swift
//  Orienté objet
//
//  Created by Lion on 05/12/2022.
//

import Foundation

struct Dammage {
    var numberofDammage: Int {
        willSet {
            self.numberofDammage = newValue
        }
    }
}
extension Dammage {
    init() {
        self.init(numberofDammage: 0)
    }
}
