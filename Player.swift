//
//  Players.swift
//  Orienté objet
//
//  Created by Lion on 06/12/2022.
//

import Foundation

class Player {
    var nameUser = String()
    var teamOfCharacters: [Character] = []
    func getUsername() -> String? {
        print("Entrez votre nom de joueur")
        let inputUser = readLine()
        return inputUser
    }
    static func getChoiceOfUser() -> String {  // retrieve the input of User
        let makeChoice = readLine() ?? ""
        return makeChoice
    }
    func browseAllCharacters() -> [Character] { // This function aims to browse all caracters avalaible
        let elfe = Elfe() // Init elfe's Caracters
        let mage = Mage()// Init mage's Caracterd
        let killer = Assassin()
        let allAvailableCharacters: [Character] = [elfe, mage, killer] // Init a constant of all caracters
        allAvailableCharacters.forEach {
            print($0.name, terminator: " " ) // Iterate all value and print name
        }
        return allAvailableCharacters
    }
    
    func choiceOfCharacter() -> [Character] { // forces the user to choose two caracters among the avalaible Caracter
        var characters: [Character] = [] // Initialize an empty array of Carecters's type
        let countCaracters = 2 // Count users init
        let availableCaracters = browseAllCharacters() // Print a view for all caracters available
        repeat {
            print("\n" + "Veuillez sélectionner \(countCaracters - characters.count) personnage parmis la liste ")
            let selectedUser = Player.getChoiceOfUser()
            if characters.contains(where: {$0.name == selectedUser}) {
                print("Vous ne pouvez pas contenir deux fois le même personnage")
            }
            for caractersName in availableCaracters where caractersName.name == selectedUser && !characters.contains(where: {$0.name == selectedUser}) {
                characters.append(caractersName)
            }
            if !characters.contains(where: {$0.name == selectedUser}) {
                print("Veuillez revérifier votre saisis")
            }
            // While user don't have two caracters the game can't start
        } while(characters.count != countCaracters)
        return characters
    }
    func selectedMyCharacter() -> Character // A method to choose a caracter among all caraters in team
    {
        var indexfinded = false
        while !indexfinded {
            print("\n" + "Selectionner le personnage que vous souhaiter utiliser \(self.nameUser)")
            self.teamOfCharacters.forEach {
                print($0.name, terminator: " ")
            }
            print()
            let inputUser = Player.getChoiceOfUser() // Retrieve the input of user for search the caracters concerned
            let charactersUsed = self.teamOfCharacters // Retrieve all caracters in team
            let selectedCharacters = charactersUsed.filter {$0.name == inputUser }
            // Returns a an array with the filters value
            if selectedCharacters.isEmpty {
                print("vérifier votre saisie")
            } else {
                let currentCaracter = selectedCharacters[0]
                indexfinded = true // the index was found we can't stop the loop
                return currentCaracter
            }
        }
    }
    func healCharacter() {
        print("Quel personnage souhaitez vous guérrir ? ")
        var characterHeal = self.selectedMyCharacter()
        characterHeal.live += 10
        print(characterHeal.name + " Recupère 10 point de vie")
    }
    init() {
        nameUser = self.getUsername()!
        self.teamOfCharacters = choiceOfCharacter()
    }
}
