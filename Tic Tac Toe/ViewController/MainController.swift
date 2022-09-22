//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ploo Jompong on 2022-09-08.
//

/*  TODO
 - Cleaning
 */

import UIKit

class ViewController: UIViewController {
    
    // Main Container
    @IBOutlet weak var boardContainer: UIStackView!
    
    // Game Board
    @IBOutlet var buttonCollection: [UIButton]!
    
    // Turn Label
    @IBOutlet weak var turnLbl: UILabel!
    
    //Switch Start Player
    @IBOutlet weak var switchStart: UIButton!
    
    // GameLogic Class
    var gameLogic: GameLogic = GameLogic()
    
    // X && O
    var x: String = "X"
    var o: String = "O"
    
    lazy var board = [UIButton]()
    
    // Custom label styles
    lazy var customTurnX = NSMutableAttributedString(string: x, attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .heavy),
        NSAttributedString.Key.foregroundColor: UIColor(red: 00/255.00, green: 197/255.00, blue: 31/255.00, alpha: 0.5)
    ])
    lazy var customTurnO = NSMutableAttributedString(string: o, attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .heavy),
        NSAttributedString.Key.foregroundColor: UIColor(red: 239/255.00, green: 83/255.00, blue: 80/255.00, alpha: 0.5)
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //styleLayout()
    }
    
    // On board tap
    @IBAction func onBoardTap(_ sender: UIButton) {
        onTap(sender)
        let result = gameLogic.result
            switch result {
            case 0:
                drawAlert()
            case 1:
                xWinAlert()
            case 2:
                oWinAlert()
            default: print("Playing")
            }
    }
    
    // Place X || O
    func onTap(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if gameLogic.currentTurn {
                turnLbl.attributedText = customTurnO
                sender.setTitle(x, for: .normal)
                sender.setTitleColor(UIColor(red: 00/255, green: 197/255, blue: 31/255, alpha: 0.5), for: .normal)
            } else {
                turnLbl.attributedText = customTurnX
                sender.setTitle(o, for: .normal)
                sender.setTitleColor(UIColor(red: 239/255.00, green: 83/255.00, blue: 80/255.00, alpha: 0.5), for: .normal)
            }
            sender.isEnabled = false
            gameLogic.addMove(tag: sender.tag)
        }
    }
    
    
    // X win alert
    func xWinAlert() {
        let alert = UIAlertController(title: "P1 Won", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in self.resetBoard() }))
        self.present(alert, animated: true)
    }
    
    // O win alert
    func oWinAlert() {
        let alert = UIAlertController(title: "P2 Won", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in self.resetBoard() }))
        self.present(alert, animated: true)
    }
    
    // Draw alert
    func drawAlert() {
        let alert = UIAlertController(title: "DRAW", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.resetBoard() }))
        self.present(alert, animated: true)
    }
    
    
    // Switch starting player
    @IBAction func switchStartPlayer(_ sender: UIButton) {
        if gameLogic.gameStarted == false {
            let alert = UIAlertController(title: "Switch Starting Player", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            if  gameLogic.currentTurn == true {
                turnLbl.attributedText = customTurnO
                gameLogic.currentTurn = false
            } else {
                turnLbl.attributedText = customTurnX
                gameLogic.currentTurn = true
            }
        } else {
            let alert = UIAlertController(title: "Game Already Started", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    // Reset board
    func resetBoard() {
        for button in buttonCollection {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        gameLogic.resetBoard()
    }
    
    /*
    func styleLayout() {
         for button in buttonCollection {
             button.layer.cornerRadius = 50.0
            //button?.clipsToBounds = true
         }
        
    }
     */

}


