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
    func browseAllCharacters() -> [Character] { // This function aims to browse all characters avalaible
        let elfe = Elfe()
        let mage = Mage()
        let killer = Assassin()
        let allAvailableCharacters: [Character] = [elfe, mage, killer] // Init a constant of all characters
        allAvailableCharacters.forEach {
            print($0.name, terminator: " " ) // Iterate all value and print name
        }
        return allAvailableCharacters
    }
    
    func choiceOfCharacters() -> [Character] { // forces the user to choose two characters among the avalaible Character
        var charactersPlayerArray: [Character] = [] // Initialize an empty array of Carecters's type
        let countCharacters = 2 // Count users init
        let availableCharacters = browseAllCharacters() // Print a view for all character available
        repeat {
            print("\n" + "Veuillez sélectionner \(countCharacters - charactersPlayerArray.count) personnage parmis la liste ")
            let selectedUser = Player.getChoiceOfUser()
            if charactersPlayerArray.contains(where: {$0.name == selectedUser}) {
                print("Vous ne pouvez pas contenir deux fois le même personnage")
            }
            for charactersName in availableCharacters where charactersName.name == selectedUser && !charactersPlayerArray.contains(where: {$0.name == selectedUser}) {
                charactersPlayerArray.append(charactersName)
            }
            if !charactersPlayerArray.contains(where: {$0.name == selectedUser}) {
                print("Veuillez revérifier votre saisis")
            }
            // While user don't have two characters the game can't start
        } while(charactersPlayerArray.count != countCharacters)
        return charactersPlayerArray
    }
    func selectedMyCharacter() -> Character // A method to choose a character among all caraters in team
    {
        var indexfinded = false
        while !indexfinded {
            print("\n" + "Selectionner le personnage que vous souhaiter utiliser \(self.nameUser)")
            self.teamOfCharacters.forEach {
                print($0.name, terminator: " ")
            }
            print()
            let inputUser = Player.getChoiceOfUser() // Retrieve the input of user for search the character concerned
            let charactersUsed = self.teamOfCharacters // Retrieve all characters in team
            let selectedCharacters = charactersUsed.filter {$0.name == inputUser }
            // Returns a an array with the filters value
            if selectedCharacters.isEmpty {
                print("vérifier votre saisie")
            } else {
                let currentCharacter = selectedCharacters[0]
                indexfinded = true // the index was found we can't stop the loop
                return currentCharacter
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
        self.teamOfCharacters = choiceOfCharacters()
    }
}
