//
//  ViewController.swift
//  lifecounter
//
//  Created by Christopher Ku on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Access History
    @IBOutlet weak var viewHistory: UIButton!
    
    // Add player
    @IBOutlet weak var addPlayerBtn: UIButton!
    
    // Player views
    @IBOutlet weak var player5View: UIStackView!
    @IBOutlet weak var player6View: UIStackView!
    @IBOutlet weak var player7View: UIStackView!
    @IBOutlet weak var player8View: UIStackView!
    
    // Player score labels
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet weak var player3Score: UILabel!
    @IBOutlet weak var player4Score: UILabel!
    @IBOutlet weak var player5Score: UILabel!
    @IBOutlet weak var player6Score: UILabel!
    @IBOutlet weak var player7Score: UILabel!
    @IBOutlet weak var player8Score: UILabel!
    
    // Player buttons
    @IBOutlet weak var player1AddBtn: UIButton!
    @IBOutlet weak var player1MinusBtn: UIButton!
    
    @IBOutlet weak var player2AddBtn: UIButton!
    @IBOutlet weak var player2MinusBtn: UIButton!
    
    @IBOutlet weak var player3AddBtn: UIButton!
    @IBOutlet weak var player3MinusBtn: UIButton!
    
    @IBOutlet weak var player4AddBtn: UIButton!
    @IBOutlet weak var player4MinusBtn: UIButton!
    
    @IBOutlet weak var player5AddBtn: UIButton!
    @IBOutlet weak var player5MinusBtn: UIButton!
    
    @IBOutlet weak var player6AddBtn: UIButton!
    @IBOutlet weak var player6MinusBtn: UIButton!
    
    @IBOutlet weak var player7AddBtn: UIButton!
    @IBOutlet weak var player7MinusBtn: UIButton!
    
    @IBOutlet weak var player8AddBtn: UIButton!
    @IBOutlet weak var player8MinusBtn: UIButton!
    
    // Player text fields
    @IBOutlet weak var player1Decrement: UITextField!
    @IBOutlet weak var player1Increment: UITextField!
    
    @IBOutlet weak var player2Decrement: UITextField!
    @IBOutlet weak var player2Increment: UITextField!
    
    @IBOutlet weak var player3Decrement: UITextField!
    @IBOutlet weak var player3Increment: UITextField!
    
    @IBOutlet weak var player4Decrement: UITextField!
    @IBOutlet weak var player4Increment: UITextField!
    
    @IBOutlet weak var player5Decrement: UITextField!
    @IBOutlet weak var player5Increment: UITextField!
    
    @IBOutlet weak var player6Decrement: UITextField!
    @IBOutlet weak var player6Increment: UITextField!
    
    @IBOutlet weak var player7Decrement: UITextField!
    @IBOutlet weak var player7Increment: UITextField!
    
    @IBOutlet weak var player8Decrement: UITextField!
    @IBOutlet weak var player8Increment: UITextField!
    
    // End game message
    @IBOutlet weak var endGameMessage: UILabel!
    
    
    var playerViewEnable : Int = 4
    var playerScores = [String: Int]()
    var lines = 0
    var history : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPlayerBtn.isEnabled = true
        player5View.isHidden = true
        player6View.isHidden = true
        player7View.isHidden = true
        player8View.isHidden = true
        endGameMessage.isHidden = true

        playerScores = ["Player 1": 20,
                        "Player 2": 20,
                        "Player 3": 20,
                        "Player 4": 20,
                        "Player 5": 20,
                        "Player 6": 20,
                        "Player 7": 20,
                        "Player 8": 20]
    }

    @IBAction func viewHistoryBtn(_ sender: Any) {
        let historyView = storyboard?.instantiateViewController(identifier: "history") as! HistoryViewController
        historyView.history = history
        historyView.lines = lines
        present(historyView, animated: true)
    }

    @IBAction func addPlayerBtn(_ sender: Any) {
        playerViewEnable += 1
        switch playerViewEnable {
        case 5:
            player5View.isHidden = false
        case 6:
            player6View.isHidden = false
        case 7:
            player7View.isHidden = false
        case 8:
            player8View.isHidden = false
        default:
            addPlayerBtn.isEnabled = false
        }
    }

    @IBAction func player1AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player1Increment.resignFirstResponder()
        let add = player1Increment.text!
        playerScores["Player 1"]! += Int(add)!
        player1Score.text = "Score: \(playerScores["Player 1"]!)"
        history.append("Player 1 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player1MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player1Decrement.resignFirstResponder()
        let subtract = player1Decrement.text!
        playerScores["Player 1"]! -= Int(subtract)!
        player1Score.text = "Score: \(playerScores["Player 1"]!)"
        history.append("Player 1 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player2AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player2Increment.resignFirstResponder()
        let add = player2Increment.text!
        playerScores["Player 2"]! += Int(add)!
        player2Score.text = "Score: \(playerScores["Player 2"]!)"
        history.append("Player 2 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player2MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player2Decrement.resignFirstResponder()
        let subtract = player2Decrement.text!
        playerScores["Player 2"]! -= Int(subtract)!
        player2Score.text = "Score: \(playerScores["Player 2"]!)"
        history.append("Player 2 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player3AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player3Increment.resignFirstResponder()
        let add = player3Increment.text!
        playerScores["Player 3"]! += Int(add)!
        player3Score.text = "Score: \(playerScores["Player 3"]!)"
        history.append("Player 3 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player3MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player3Decrement.resignFirstResponder()
        let subtract = player3Decrement.text!
        playerScores["Player 3"]! -= Int(subtract)!
        player3Score.text = "Score: \(playerScores["Player 3"]!)"
        history.append("Player 3 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player4AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player4Increment.resignFirstResponder()
        let add = player4Increment.text!
        playerScores["Player 4"]! += Int(add)!
        player4Score.text = "Score: \(playerScores["Player 4"]!)"
        history.append("Player 4 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player4MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player4Decrement.resignFirstResponder()
        let subtract = player4Decrement.text!
        playerScores["Player 4"]! -= Int(subtract)!
        player4Score.text = "Score: \(playerScores["Player 4"]!)"
        history.append("Player 4 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player5AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player5Increment.resignFirstResponder()
        let add = player5Increment.text!
        playerScores["Player 5"]! += Int(add)!
        player5Score.text = "Score: \(playerScores["Player 5"]!)"
        history.append("Player 5 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player5MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player5Decrement.resignFirstResponder()
        let subtract = player5Decrement.text!
        playerScores["Player 5"]! -= Int(subtract)!
        player5Score.text = "Score: \(playerScores["Player 5"]!)"
        history.append("Player 5 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player6AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player6Increment.resignFirstResponder()
        let add = player6Increment.text!
        playerScores["Player 6"]! += Int(add)!
        player6Score.text = "Score: \(playerScores["Player 6"]!)"
        history.append("Player 6 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player6MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player6Decrement.resignFirstResponder()
        let subtract = player6Decrement.text!
        playerScores["Player 6"]! -= Int(subtract)!
        player6Score.text = "Score: \(playerScores["Player 6"]!)"
        history.append("Player 6 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player7AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player7Increment.resignFirstResponder()
        let add = player7Increment.text!
        playerScores["Player 7"]! += Int(add)!
        player7Score.text = "Score: \(playerScores["Player 7"]!)"
        history.append("Player 7 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player7MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player7Decrement.resignFirstResponder()
        let subtract = player7Decrement.text!
        playerScores["Player 7"]! -= Int(subtract)!
        player7Score.text = "Score: \(playerScores["Player 7"]!)"
        history.append("Player 7 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player8AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player8Increment.resignFirstResponder()
        let add = player8Increment.text!
        playerScores["Player 8"]! += Int(add)!
        player8Score.text = "Score: \(playerScores["Player 8"]!)"
        history.append("Player 8 gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player8MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        player8Decrement.resignFirstResponder()
        let subtract = player8Decrement.text!
        playerScores["Player 8"]! -= Int(subtract)!
        player8Score.text = "Score: \(playerScores["Player 8"]!)"
        history.append("Player 8 lost \(subtract) life \n")
        lines += 1
        evaluate()
    }



    func evaluate() {
        for (player, life) in playerScores {
            if life <= 0 {
                endGameMessage.text = "\(player) lost the game!"
                endGameMessage.isHidden = false
                player1AddBtn.isEnabled = false
                player1MinusBtn.isEnabled = false
                player2AddBtn.isEnabled = false
                player2MinusBtn.isEnabled = false
                player3AddBtn.isEnabled = false
                player3MinusBtn.isEnabled = false
                player4AddBtn.isEnabled = false
                player4MinusBtn.isEnabled = false
                player5AddBtn.isEnabled = false
                player5MinusBtn.isEnabled = false
                player6AddBtn.isEnabled = false
                player6MinusBtn.isEnabled = false
                player7AddBtn.isEnabled = false
                player7MinusBtn.isEnabled = false
                player8AddBtn.isEnabled = false
                player8MinusBtn.isEnabled = false
                player1Decrement.isEnabled = false
                player1Increment.isEnabled = false
                player2Decrement.isEnabled = false
                player2Increment.isEnabled = false
                player3Decrement.isEnabled = false
                player3Increment.isEnabled = false
                player4Decrement.isEnabled = false
                player4Increment.isEnabled = false
                player5Decrement.isEnabled = false
                player5Increment.isEnabled = false
                player6Decrement.isEnabled = false
                player6Increment.isEnabled = false
                player7Decrement.isEnabled = false
                player7Increment.isEnabled = false
                player8Decrement.isEnabled = false
                player8Increment.isEnabled = false
            }
        }
    }
    
}

