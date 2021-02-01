//
//  Game.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 11/12/2020.
//

import Foundation

class Game {
    
    // MARK: - Properties
    
    var players: [Player] = []
    var numberOfTurn = 0
    
    // MARK: - Functions
    
    //the start function will allow you to initiate the battle function is to initiate player 1 and 2
    func start() {
        print (Contant.homeMessage)
        print ("")
        print (Contant.regleDuJeux)
        for i in 0..<2 {
            print("Player \(i + 1) constituez votre équipe !")
            let player = Player()
            players.append(player)
        }
        battle()
        scoreOfplayers()
    }
    
    //the battle function will allow the player to attack or heal in turn thanks to a for loop and a while loop
    private func battle() {
        while true {
            for i in 0..<2 {
                print("équipe \(i+1) choisisez votre  personnages 😄")
                players[i].playerCharacter()
                let playerSelectedCharacter = players[i].characters[userChoiceInFightStatement()-1]
                TreasureChest.open(character: playerSelectedCharacter)
                if let paladins = playerSelectedCharacter as? Paladin {
                    print ("souhaitez vous attaquer ou soignez")
                    print ("1 - attaquer ")
                    print ("2 - soigner ")
                    let userChoice = userChoiceInHealStatement()
                    if userChoice == 1 {
                        print ("choisisez le personnages a attaquer 🤫")
                        if i == 0 {
                            attackPhase(selectedCharacter: playerSelectedCharacter, player: players[i+1])
                            if players[i+1].isDead() { return }
                        } else {
                            attackPhase(selectedCharacter: playerSelectedCharacter, player: players[i-1])
                            if players[i-1].isDead() {  return }
                        }
                    } else {
                        healPhase(selectedCharacter: paladins, player: players[i])
                    }
                } else {
                    print ("choisisez le personnages a attaquer 🤫")
                    if i == 0 {
                        attackPhase(selectedCharacter: playerSelectedCharacter, player: players[i+1])
                        if players[i+1].isDead() { return }
                        
                    } else {
                        attackPhase(selectedCharacter: playerSelectedCharacter, player: players[i-1])
                        if players[i-1].isDead() { return }
                    }
                }
            }
            numberOfTurn += 1
        }
    }
    
    //userChoice InFightStatement will allow attacking with the paladins the character of the opposing team to attack
    private func userChoiceInFightStatement() -> Int {
        var userChoice = 0
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3
        return userChoice
    }

    private func userChoiceInHealStatement() -> Int {
        var userChoice = 0
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                }
            }
        } while userChoice != 1 && userChoice != 2
        return userChoice
    }
    
    //userChoice attackPhase will allow attacking with the paladins the character of the opposing team to attack
    private func attackPhase(selectedCharacter: Character, player: Player) {
        player.playerCharacter()
        let punchedCharacter = player.characters[userChoiceInFightStatement()-1]
        selectedCharacter.attack(target: punchedCharacter)
    }
    
    //the userChoice Healphase function will allow the user to heal with the paladin
    private func healPhase(selectedCharacter: Paladin, player: Player) {
        print ("qu'elle personnages voulez soigner ?💉")
        player.playerCharacter()
        let characterToHeal = player.characters[userChoiceInFightStatement()-1]
        selectedCharacter.care(target: characterToHeal)
    }
    
    //the score Of players function will allow you to display the score of the winning team and the dead characters of each team as well as the number of games
    private func scoreOfplayers() {
        print ("la partie est finie")
        for (i, player) in players.enumerated() {
            if player.isDead() {
                if i == 0 {
                    print ("Player \(i + 1) est le vainqueur")
                    print ("")
                    print ("la partie contient \(numberOfTurn) tours.")
                    print ("")
                    print ("l'équipe du player 1 :")
                    players[i].playerCharacter()
                    print ("")
                    print ("l'équipe du player 2 :")
                    players[i+1].playerCharacter()
                    print ("")
                } else {
                    print ("Player \(i + 1) est le vainqueur")
                    print ("")
                    print ("la partie contient \(numberOfTurn) tours.")
                    print ("")
                    print ("l'équipe du player 1 :")
                    players[i-1].playerCharacter()
                    print ("")
                    print ("l'équipe du player 2 :")
                    players[i].playerCharacter()
                }
            }
        }
    }
}
