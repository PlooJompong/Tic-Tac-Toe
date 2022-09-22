//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ploo Jompong on 2022-09-08.
//

/*  TODO
 - Add Score
 - New layout//design?
 - Remove Restart Button?
 - Cleaning
 */


import UIKit

class ViewController: UIViewController {
    
    var gameLogic: GameLogic = GameLogic()
    
    // Main Container
    @IBOutlet weak var boardContainer: UIStackView!
    
    // Game Board
    @IBOutlet var buttonCollection: [UIButton]!
    
    // Turn Label
    @IBOutlet weak var turnLbl: UILabel!
    
    //Switch Start Player
    @IBOutlet weak var switchStart: UIButton!
    
    // Reset Button
    @IBOutlet weak var resetBtn: UIButton!
    
    // Current turn: true = Player 1 (X)
    // var currentTurn: Bool = true
    
    // Game stared = false
    //var gameStarted: Bool = false
    
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
        //checkWinner()
        gameLogic.checkWinner()
        //drawAlert()
        
        if fullBoard() {
            drawAlert()
            print("DRAW")
        }
        
        
    }
    
    // Place X || O
    
    func onTap(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if gameLogic.currentTurn {
                //gameLogic.addMove(tag: sender.tag)
                turnLbl.attributedText = customTurnO
                sender.setTitle(x, for: .normal)
                sender.setTitleColor(UIColor(red: 00/255, green: 197/255, blue: 31/255, alpha: 0.5), for: .normal)
                //gameLogic.currentTurn = false
            } else {
                //gameLogic.addMove(tag: sender.tag)
                turnLbl.attributedText = customTurnX
                sender.setTitle(o, for: .normal)
                sender.setTitleColor(UIColor(red: 239/255.00, green: 83/255.00, blue: 80/255.00, alpha: 0.5), for: .normal)
                //gameLogic.currentTurn = true
            }
            sender.isEnabled = false
            gameLogic.gameStarted = true
            gameLogic.addMove(tag: sender.tag)
        }
    }
    
    
    // Check if the borad is full
    func fullBoard() -> Bool {
        for button in buttonCollection {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    
    // Win conditions
    func checkWinner() {
        // X win condition
         
        /*
        if ((buttonCollection[0].title(for: .normal) == x && buttonCollection[1].title(for: .normal) == x && buttonCollection[2].title(for: .normal) == x) ||
            (buttonCollection[3].title(for: .normal) == x && buttonCollection[4].title(for: .normal) == x && buttonCollection[5].title(for: .normal) == x) ||
            (buttonCollection[6].title(for: .normal) == x && buttonCollection[7].title(for: .normal) == x && buttonCollection[8].title(for: .normal) == x) ||
            (buttonCollection[0].title(for: .normal) == x && buttonCollection[3].title(for: .normal) == x && buttonCollection[6].title(for: .normal) == x) ||
            (buttonCollection[1].title(for: .normal) == x && buttonCollection[4].title(for: .normal) == x && buttonCollection[7].title(for: .normal) == x) ||
            (buttonCollection[2].title(for: .normal) == x && buttonCollection[5].title(for: .normal) == x && buttonCollection[8].title(for: .normal) == x) ||
            (buttonCollection[0].title(for: .normal) == x && buttonCollection[4].title(for: .normal) == x && buttonCollection[8].title(for: .normal) == x) ||
            (buttonCollection[2].title(for: .normal) == x && buttonCollection[4].title(for: .normal) == x && buttonCollection[6].title(for: .normal) == x)) {
            let alert = UIAlertController(title: "X win", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in self.resetBoard() }))
            self.present(alert, animated: true)
            gameLogic.resetBoard()
        }
        
        
        // O win condition
        else if ((buttonCollection[0].title(for: .normal) == o && buttonCollection[1].title(for: .normal) == o && buttonCollection[2].title(for: .normal) == o) ||
                 (buttonCollection[3].title(for: .normal) == o && buttonCollection[4].title(for: .normal) == o && buttonCollection[5].title(for: .normal) == o) ||
                 (buttonCollection[6].title(for: .normal) == o && buttonCollection[7].title(for: .normal) == o && buttonCollection[8].title(for: .normal) == o) ||
                 (buttonCollection[0].title(for: .normal) == o && buttonCollection[3].title(for: .normal) == o && buttonCollection[6].title(for: .normal) == o) ||
                 (buttonCollection[1].title(for: .normal) == o && buttonCollection[4].title(for: .normal) == o && buttonCollection[7].title(for: .normal) == o) ||
                 (buttonCollection[2].title(for: .normal) == o && buttonCollection[5].title(for: .normal) == o && buttonCollection[8].title(for: .normal) == o) ||
                 (buttonCollection[0].title(for: .normal) == o && buttonCollection[4].title(for: .normal) == o && buttonCollection[8].title(for: .normal) == o) ||
                 (buttonCollection[2].title(for: .normal) == o && buttonCollection[4].title(for: .normal) == o && buttonCollection[6].title(for: .normal) == o)) {
            let alert = UIAlertController(title: "O win", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in self.resetBoard() }))
            self.present(alert, animated: true)
            gameLogic.resetBoard()
        }
         */
    }
    
    // Draw alert
    func drawAlert() {
        let alert = UIAlertController(title: "DRAW", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.resetBoard() }))
        self.present(alert, animated: true)
        gameLogic.resetBoard()
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
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Reset board
    func resetBoard() {
        for button in buttonCollection {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
            gameLogic.gameStarted = false
        }
    }
}


//    func styleLayout() {
//        for button in buttonCollection {
//            button.layer.cornerRadius = 50.0
//            //button?.clipsToBounds = true
//        }
//    }
