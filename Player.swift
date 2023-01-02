//
//  Players.swift
//  Orienté objet
//
//  Created by Lion on 06/12/2022.
//

import Foundation

class Player {
    var nameUser = String()
    var teamOfCaracters: [Caracter] = []
    var playerHasplay = false
    func getUsername() -> String? {
        print("Entrez votre nom de joueur")
        let inputUser = readLine()
        return inputUser
    }
    static func getChoiceOfUser() -> String {  // retrieve the input of User
        let makeChoice = readLine() ?? ""
        return makeChoice
    }
    func browseAllCaracters() -> [Caracter] { // This function aims to browse all caracters avalaible
        let elfe = Elfe() // Init elfe's Caracters
        let mage = Mage()// Init mage's Caracterd
        let killer = Assassin()
        let allAvailableCaracters: [Caracter] = [elfe, mage, killer] // Init a constant of all caracters
        allAvailableCaracters.forEach {
            print($0.name, terminator: " " ) // Iterate all value and print name
        }
        return allAvailableCaracters
    }

    func choiceOfCaracters() -> [Caracter] { // forces the user to choose two caracters among the avalaible Caracter
        var caractersPlayerArray: [Caracter] = [] // Initialize an empty array of Carecters's type
        let countCaracters = 2 // Count users init
        let availableCaracters = browseAllCaracters() // Print a view for all caracters available
        repeat {
            print("\n" + "Veuillez sélectionner \(countCaracters - caractersPlayerArray.count) personnage parmis la liste ")
            let selectedUser = Player.getChoiceOfUser()
            if caractersPlayerArray.contains(where: {$0.name == selectedUser}) {
                print("Vous ne pouvez pas contenir deux fois le même personnage")
            }
    for caractersName in availableCaracters where caractersName.name == selectedUser && !caractersPlayerArray.contains(where: {$0.name == selectedUser}) {
                caractersPlayerArray.append(caractersName)
            }
            if !caractersPlayerArray.contains(where: {$0.name == selectedUser}) {
                print("Veuillez revérifier votre saisis")
            }
            // While user don't have two caracters the game can't start
        } while(caractersPlayerArray.count != countCaracters)
        return caractersPlayerArray
    }
    func selectedMyCaracter() -> Caracter // A method to choose a caracter among all caraters in team
    {
        var indexfinded = false
        while !indexfinded {
            print("\n" + "Selectionner le personnage que vous souhaiter utiliser \(self.nameUser)")
            self.teamOfCaracters.forEach {
                print($0.name, terminator: " ")
            }
            print()
            let inputUser = Player.getChoiceOfUser() // Retrieve the input of user for search the caracters concerned
            let caractersUsed = self.teamOfCaracters // Retrieve all caracters in team
            let selectedCaracters = caractersUsed.filter {$0.name == inputUser }
            // Returns a an array with the filters value
            if selectedCaracters.isEmpty {
                print("vérifier votre saisie")
            } else {
                let currentCaracter = selectedCaracters[0]
                indexfinded = true // the index was found we can't stop the loop
                return currentCaracter
            }
        }
    }
    func healCaracter() {
        print("Quel personnage souhaitez vous guérrir ? ")
        var caracterHeal = self.selectedMyCaracter()
        caracterHeal.live += 10
        print(caracterHeal.name + " Recupère 10 point de vie")
        }
            init() {
                nameUser = self.getUsername()!
                self.teamOfCaracters = choiceOfCaracters()
            }
        }
