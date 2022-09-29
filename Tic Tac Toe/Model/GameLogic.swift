//
//  File.swift
//  Tic Tac Toe
//
//  Created by Ploo Jompong on 2022-09-20.
//

import Foundation

class GameLogic {
    /*
     var player1: Player
     var player2: Player
     
     init(player1: Player, player2: Player) {
     self.player1 = player1
     self.player2 = player2
     }
     */
    
    // Current turn = X = true
    var currentTurn: Bool = true
    
    // Check if game already started
    var gameStarted: Bool = false
    
    // Win conditions
    let winConditions: Array<Array<Int>> = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    // Plyers moves
    var xTurn: Array<Int> = []
    var oTurn: Array<Int> = []
    //var computerTurn: Array<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    //var checkBoard: Array<Int> = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // vs Computer
    var vsComputer: Bool = false
    
    // GAME_STATES
    let GAME_CONTINUE = -1
    let GAME_DRAW = 0
    let GAME_PLAYER_X_WON = 1
    let GAME_PLAYER_O_WON = 2
    let GAME_PLAYER_AI_WON = 3
    
    var board = 0
    
    // Add move to Player Array
    func addMove(tag: Int) {
        if !fullBoard() {
            // PVP
            if !vsComputer {
                if currentTurn == true {
                    xTurn.append(tag)
                    currentTurn = false
                } else {
                    oTurn.append(tag)
                    currentTurn = true
                }
            }
            // PVE
            /*
               else {
                
            }
            */
            board += 1
            
            if board > 4 {
                _ = checkResult()
            }
            
        }
        gameStarted = true
    }
    
    // computerMove
    /*
    func computerMove() {
        }
    }
     */
    
    // Check if board is full
    func fullBoard() -> Bool {
        if board > 8 {
            return true
        }
        return false
    }
    
    // Check winner
    func checkResult() -> Int {
        if !fullBoard() && GAME_CONTINUE == -1 {
            if !vsComputer {
                let pvpResult = checkPvpResult()
                return pvpResult
            } else {
                return 999
            }
            // PVE Result
            /*
            else {
                let pveResult = checkPveResult()
                return pveResult
            }
             */
        } else {
            return GAME_DRAW
        }
    }
    
    // Reset Board
    func resetBoard() {
        xTurn = []
        oTurn = []
        //computerTurn = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        //checkBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        board = 0
        gameStarted = false
    }
    
    // Check PVP Winner
    func checkPvpResult() -> Int {
        if winConditions[0].allSatisfy({xTurn.contains($0)}) ||
            winConditions[1].allSatisfy({xTurn.contains($0)}) ||
            winConditions[2].allSatisfy({xTurn.contains($0)}) ||
            winConditions[3].allSatisfy({xTurn.contains($0)}) ||
            winConditions[4].allSatisfy({xTurn.contains($0)}) ||
            winConditions[5].allSatisfy({xTurn.contains($0)}) ||
            winConditions[6].allSatisfy({xTurn.contains($0)}) ||
            winConditions[7].allSatisfy({xTurn.contains($0)}) {
            return GAME_PLAYER_X_WON
        }
        
        // O Win conditions
        else if winConditions[0].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[1].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[2].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[3].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[4].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[5].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[6].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[7].allSatisfy({oTurn.contains($0)}) {
            return GAME_PLAYER_O_WON
        }
        // No winner && continue
        return GAME_CONTINUE
    }
    
    // Check PVE Winner
    func checkPveResult() -> Int {
        if winConditions[0].allSatisfy({xTurn.contains($0)}) ||
            winConditions[1].allSatisfy({xTurn.contains($0)}) ||
            winConditions[2].allSatisfy({xTurn.contains($0)}) ||
            winConditions[3].allSatisfy({xTurn.contains($0)}) ||
            winConditions[4].allSatisfy({xTurn.contains($0)}) ||
            winConditions[5].allSatisfy({xTurn.contains($0)}) ||
            winConditions[6].allSatisfy({xTurn.contains($0)}) ||
            winConditions[7].allSatisfy({xTurn.contains($0)}) {
            return GAME_PLAYER_X_WON
        }
        
        // O Win conditions
        else if winConditions[0].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[1].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[2].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[3].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[4].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[5].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[6].allSatisfy({oTurn.contains($0)}) ||
                    winConditions[7].allSatisfy({oTurn.contains($0)}) {
            return GAME_PLAYER_AI_WON
        }
        // No winner && continue
        return GAME_CONTINUE
    }
    
    // -----------
}
