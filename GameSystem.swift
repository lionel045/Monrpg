//
//  Assasin.swift
//  Orienté objet
//
//  Created by Lion on 12/12/2022.
//
import Foundation

class GameSystem {
    var countTour = 0
    var allCaratersIsAlive = true // init an variable who chek if all caracter's player are live
    func checkCaractersPlayerlive(currentplayer: Player) {
        if currentplayer.teamOfCaracters.contains(where: {$0.live <= 0 }) {
            print("Votre personnage est désormais Ko \(currentplayer.nameUser)")
            currentplayer.teamOfCaracters.removeAll(where: {$0.live <= 0 })
        }
    }
    func selectedOponentCaracters(openent: Player ) -> Caracter {
        let openentSelected = openent.teamOfCaracters // Retrieve all caracters in team
        var indexFinded = false // create an boolean variable for check if the index in array was found
        print("Selectionner le personnage que vous souhaiter attaquer parmis les personnage de \(openent.nameUser):" )
        while !indexFinded {
            openent.teamOfCaracters.forEach {
                print($0.name, terminator: " " )
            }
            print()
            let inputUser = Player.getChoiceOfUser() // retrieve input of user
            let ennemySelected = openentSelected.filter({ $0.name == inputUser })
            // Create an Caracters array who return only one element filtred
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
    func findMagicalChest(currentCaracters: inout Caracter) {
        let dagger = Dagger()
        let sword = Sword()
        let scepter = Scepter()
        let allAvailableWeapon: [Weapon] = [dagger, sword, scepter]
        let chest = allAvailableWeapon.randomElement()
        currentCaracters.weapon = chest
        let nameOfweapon = currentCaracters.weapon?.name ?? ""
        print(currentCaracters.name + " " + "Tombe sur un coffre et trouve \(nameOfweapon)")
    }
    func makeAnAction(currentPlayer: Player, ennemy: Player) {
        var choiceofUser = String()
        while choiceofUser != "A" || choiceofUser != "B"{
            print("Quel action souhaitiez vous Effectuer \(currentPlayer.nameUser)")
            print("A: Attaquer  \n  B: Soigné ")
            choiceofUser = Player.getChoiceOfUser()
            if choiceofUser == "A" || choiceofUser == "a" {
                var caractersWhoattack = currentPlayer.selectedMyCaracter()
                findMagicalChest(currentCaracters: &caractersWhoattack)
                var ennemy = self.selectedOponentCaracters(openent: ennemy)
                caractersWhoattack.attack(ennemy: &ennemy)
                break
            } else if choiceofUser == "b" || choiceofUser == "B" {
                currentPlayer.healCaracter()
                break
            }
        }
    }
    // Check who win
    func checkWhoWin(player1: Player, player2: Player) {
        if player1.teamOfCaracters.count == 0 {
            print("Le joueur 2 a gg en \(countTour) tour ")
            allCaratersIsAlive = false
        } else if player2.teamOfCaracters.count == 0 {
            print("Le joueur 1 a gg  en \(countTour) tour")
            allCaratersIsAlive = false
        }
    }
    func launchGame(player1: Player, player2: Player) { // Start the game with the two player
        var currentPlayer = player1
        var otherPlayer = player2
        while  allCaratersIsAlive { // While the boolean is true we  loop
            self.makeAnAction(currentPlayer: currentPlayer, ennemy: otherPlayer)
            self.checkCaractersPlayerlive(currentplayer: player1) // Check if the Caracter's player was live
            self.checkCaractersPlayerlive(currentplayer: player2)
            self.checkWhoWin(player1: player1, player2: player2)
            (currentPlayer, otherPlayer) = (otherPlayer, currentPlayer)
            countTour += 1
        }
    }
}
