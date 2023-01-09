//
//  Assasin.swift
//  Orienté objet
//
//  Created by Lion on 12/12/2022.
//
import Foundation
class GameSystem {
    var countTour = 0
    var allCharatersIsAlive = true // init an variable who chek if all character's player are live
    func checkPlayerCharactersLive(currentplayer: Player) {
        if currentplayer.teamOfCharacters.contains(where: {$0.live <= 0 }) {
                print("Votre personnage est désormais Ko \(currentplayer.nameUser)")
                currentplayer.teamOfCharacters.removeAll(where: {$0.live <= 0 })
            }
    }
    func selectedOponentCharacters(openent: Player ) -> Character {
        let openentSelected = openent.teamOfCharacters // Retrieve all characters in team
        var indexFinded = false // create an boolean variable for check if the index in array was found
        print("Selectionner le personnage que vous souhaiter attaquer parmis les personnage de \(openent.nameUser):" )
        while !indexFinded {
            openent.teamOfCharacters.forEach {
                print($0.name, terminator: " " )
            }
            print()
            let inputUser = Player.getChoiceOfUser() // retrieve input of user
            let ennemySelected = openentSelected.filter({ $0.name == inputUser })
            // Create an Character array who return only one element filtred
            if ennemySelected.isEmpty {
                print("vérifier votre saisie")
                print("Selectionner le personnage que vous souhaiter attaquer parmis les personnage de \(openent.nameUser):" )
            } else {
                let ennemy = ennemySelected[0]
                indexFinded = true // the index was found we can't stop the loop
                return ennemy
            }
        }
    }
    // setting up a magic chest system
    func findMagicalChest(currentCharacters: inout Character) {
        let dagger = Dagger()
        let sword = Sword()
        let scepter = Scepter()
        let allAvailableWeapon: [Weapon] = [dagger, sword, scepter]
        let chest = allAvailableWeapon.randomElement()
        currentCharacters.weapon = chest
        let nameOfweapon = currentCharacters.weapon?.weaponName ?? ""
        print(currentCharacters.name + " " + "Tombe sur un coffre et trouve \(nameOfweapon)")
    }
    func makeAnAction(currentPlayer: Player, ennemy: Player) {
        var choiceofUser = String()
        while choiceofUser != "A" && choiceofUser != "B"{
            print("Quel action souhaitiez vous Effectuer \(currentPlayer.nameUser)")
            print("A: Attaquer  \n  B: Soigné ")
            choiceofUser = Player.getChoiceOfUser()
            if choiceofUser == "A" || choiceofUser == "a" {
                var charactersWhoattack = currentPlayer.selectedMyCharacter()
                findMagicalChest(currentCharacters: &charactersWhoattack)
                var target = self.selectedOponentCharacters(openent: ennemy)
                charactersWhoattack.attack(ennemy: &target)
                break
            } else if choiceofUser == "b" || choiceofUser == "B" {
                currentPlayer.healCharacter()
                break
            }
        }
    }
    // Check who win
    func checkWhoWin(player1: Player, player2: Player) {
        if player1.teamOfCharacters.count == 0 {
            print("Le joueur 2 a gg en \(countTour) tour ")
        } else if player2.teamOfCharacters.count == 0 {
            print("Le joueur 1 a gg  en \(countTour) tour")
        }
    }
       func launchGame(player1: Player, player2: Player) { // Start the game with the two player
        var currentPlayer = player1
        var otherPlayer = player2
        while  player1.teamOfCharacters.count > 0 && player2.teamOfCharacters.count > 0 { // check team of each player
            self.makeAnAction(currentPlayer: currentPlayer, ennemy: otherPlayer)
            self.checkPlayerCharactersLive(currentplayer: player1) // Check if the Character's player was live
            self.checkPlayerCharactersLive(currentplayer: player2)
            self.checkWhoWin(player1: player1, player2: player2)
            (currentPlayer, otherPlayer) = (otherPlayer, currentPlayer)
            countTour += 1
        }
    }
}
