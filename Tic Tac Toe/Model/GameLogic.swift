//
//  File.swift
//  Tic Tac Toe
//
//  Created by Ploo Jompong on 2022-09-20.
//

import Foundation

class GameLogic {
    
    var currentTurn: Bool = true
    var gameStarted: Bool = false
    
    var board: Int = 0
    
    let winConditions: Array<Array<Int>> = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    var xTurn: Array<Int> = []
    var oTurn: Array<Int> = []
    
    func resetBoard() {
        xTurn = []
        oTurn = []
        board = 0
        gameStarted = false
    }
    
    func addMove(tag: Int)  {
        
        if currentTurn == true {
            xTurn.append(tag)
            
            print("X: \(xTurn)")
            
            currentTurn = false
            print("xTurn sorted: \(xTurn.sorted())")
        } else {
            
            oTurn.append(tag)
            print("O: \(oTurn)")
            
            currentTurn = true
        }
        board += 1
    }
    
    func checkWinner() {
        if board > 4 {
            if #available(iOS 16.0, *) {
                if xTurn.sorted().contains(winConditions[0]) ||
                    xTurn.sorted().contains(winConditions[1]) ||
                    xTurn.sorted().contains(winConditions[2]) ||
                    
                    xTurn.sorted().contains(winConditions[3])
            /*
                 
            När jag la till xTurn.sorted().contains(winConditions[3]) så fungera det inte som jag vill.
            Den printa bara "X win" när jag lägger X tre gånger i rad utan att ha ha valt en annan i mellan alltså [0, 3, 6] så får jag "X win" men om t.ex [0, 3, 2, 6] == "TEST".

            Jag tror det är pga att xTurn.sorted() sortera om från t.ex. [0, 3, 2, 6] till [0, 2, 3, 6] vilket leder till att xTurn != winCondition[3] som är [0, 3, 6]
                 
            Har du tips på hur jag ska lösa det?
                 
            */
                {
                    print("---")
                    print("X win")
                } else {
                    print("---")
                    print("TEST")
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}




