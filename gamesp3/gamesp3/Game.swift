//
//  Game.swift
//  gamesp3
//
//  Created by Dimitry Aumont on 11/12/2020.
//

import Foundation

class Game {
    var players: [Player] = []
    var playerTurn = true
    static var uniqueChoiceCharacter: [Int] = []
    
    func start() {
        for _ in 0..<2 {
            let player = Player()
            players.append(player)
        }
        battle()
    }
    
    func battle() {
        while true {
            for i in 0..<2 {
                print("équipe \(i+1) choisisez votre  personnages 😄")
                players[i].playerCharacter()
                var userChoice = 0
                repeat {
                    if let data = readLine() {
                        if let dataToInt = Int(data) {
                            userChoice = dataToInt
                        }
                    }
                }while userChoice != 1 && userChoice != 2 && userChoice != 3
                let playerSelectedCharacter = players[i].characters[userChoice-1]
                if let paladins = playerSelectedCharacter as? Paladins {
                    print ("souhaitez vous attaquer ou soignez")
                    print ("1 - attaquer ")
                    print ("2 - soigner ")
                    userChoice = 0
                    repeat {
                        if let data = readLine() {
                            if let dataToInt = Int(data) {
                                userChoice = dataToInt
                            }
                        }
                    }while userChoice != 1 && userChoice != 2
                    if userChoice == 1 {
                        print ("choisisez le personnages a attaquer 🤫")
                        if i == 0 {
                            players[i+1].playerCharacter()
                            userChoice = 0
                            repeat {
                                if let data = readLine() {
                                    if let dataToInt = Int(data) {
                                        userChoice = dataToInt
                                    }
                                }
                            }while userChoice != 1 && userChoice != 2 && userChoice != 3
                            
                            let punchedCharacter = players[i+1].characters[userChoice-1]
                            playerSelectedCharacter.attack(target: punchedCharacter)
                            if players[i+1].isDead() {
                                return
                            }
                        } else {
                            players[i-1].playerCharacter()
                            userChoice = 0
                            repeat {
                                if let data = readLine() {
                                    if let dataToInt = Int(data) {
                                        userChoice = dataToInt
                                    }
                                }
                            }while userChoice != 1 && userChoice != 2 && userChoice != 3
                            
                            let punchedCharacter = players[i-1].characters[userChoice-1]
                            playerSelectedCharacter.attack(target: punchedCharacter)
                            if players[i-1].isDead() {
                                return
                            }
                            
                        }
                        
                    }else {
                        print ("qu'elle personnages voulez soigner ?")
                        players[i].playerCharacter()
                        userChoice = 0
                        repeat {
                            if let data = readLine() {
                                if let dataToInt = Int(data) {
                                    userChoice = dataToInt
                                }
                            }
                        }while userChoice != 1 && userChoice != 2 && userChoice != 3
                        let characterToHeal = players[i].characters[userChoice-1]
                        paladins.care(target: characterToHeal)
                    }
                }
                print ("choisisez le personnages a attaquer 🤫")
                if i == 0 {
                    players[i+1].playerCharacter()
                    userChoice = 0
                    repeat {
                        if let data = readLine() {
                            if let dataToInt = Int(data) {
                                userChoice = dataToInt
                            }
                        }
                    }while userChoice != 1 && userChoice != 2 && userChoice != 3
                    
                    let punchedCharacter = players[i+1].characters[userChoice-1]
                    playerSelectedCharacter.attack(target: punchedCharacter)
                    if players[i+1].isDead() {
                        return
                    }
                } else {
                    players[i-1].playerCharacter()
                    userChoice = 0
                    repeat {
                        if let data = readLine() {
                            if let dataToInt = Int(data) {
                                userChoice = dataToInt
                            }
                        }
                    }while userChoice != 1 && userChoice != 2 && userChoice != 3
                    
                    let punchedCharacter = players[i-1].characters[userChoice-1]
                    playerSelectedCharacter.attack(target: punchedCharacter)
                    if players[i-1].isDead() {
                        return
                    }
                }
                
            }
        }
        
        
        
    }
}
