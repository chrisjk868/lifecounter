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
    
    // Remove player
    @IBOutlet weak var removePlayerBtn: UIButton!
    
    // Player views
    @IBOutlet weak var player1View: UIStackView!
    @IBOutlet weak var player2View: UIStackView!
    @IBOutlet weak var player3View: UIStackView!
    @IBOutlet weak var player4View: UIStackView!
    @IBOutlet weak var player5View: UIStackView!
    @IBOutlet weak var player6View: UIStackView!
    @IBOutlet weak var player7View: UIStackView!
    @IBOutlet weak var player8View: UIStackView!
    
    // Player names
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player3Name: UILabel!
    @IBOutlet weak var player4Name: UILabel!
    @IBOutlet weak var player5Name: UILabel!
    @IBOutlet weak var player6Name: UILabel!
    @IBOutlet weak var player7Name: UILabel!
    @IBOutlet weak var player8Name: UILabel!
    
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
    
    // Reset game
    @IBOutlet weak var resetGame: UIButton!
    
    var playerViewEnable : Int = 4
    var playerScores = [String: Int]()
    var lines = 0
    var history : [String] = []
    var nameTracker = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPlayerBtn.isEnabled = true
        removePlayerBtn.isEnabled = true
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
        nameTracker = ["Player 1": ["Player 1"],
                       "Player 2": ["Player 2"],
                       "Player 3": ["Player 3"],
                       "Player 4": ["Player 4"],
                       "Player 5": ["Player 5"],
                       "Player 6": ["Player 6"],
                       "Player 7": ["Player 7"],
                       "Player 8": ["Player 8"]]
        
        setupLabelTapPlayer1()
        setupLabelTapPlayer2()
        setupLabelTapPlayer3()
        setupLabelTapPlayer4()
        setupLabelTapPlayer5()
        setupLabelTapPlayer6()
        setupLabelTapPlayer7()
        setupLabelTapPlayer8()
        
        player1Decrement.keyboardType = .numberPad
        player1Increment.keyboardType = .numberPad
        
        player2Decrement.keyboardType = .numberPad
        player2Increment.keyboardType = .numberPad
        
        player3Decrement.keyboardType = .numberPad
        player3Increment.keyboardType = .numberPad
        
        player4Decrement.keyboardType = .numberPad
        player4Increment.keyboardType = .numberPad
        
        player5Decrement.keyboardType = .numberPad
        player5Increment.keyboardType = .numberPad
        
        player6Decrement.keyboardType = .numberPad
        player6Increment.keyboardType = .numberPad
        
        player7Decrement.keyboardType = .numberPad
        player7Increment.keyboardType = .numberPad
        
        player8Decrement.keyboardType = .numberPad
        player8Increment.keyboardType = .numberPad
        
        addDoneButtonOnNumpad(textField: player1Decrement)
        addDoneButtonOnNumpad(textField: player1Increment)
        addDoneButtonOnNumpad(textField: player2Decrement)
        addDoneButtonOnNumpad(textField: player2Increment)
        addDoneButtonOnNumpad(textField: player3Decrement)
        addDoneButtonOnNumpad(textField: player3Increment)
        addDoneButtonOnNumpad(textField: player4Decrement)
        addDoneButtonOnNumpad(textField: player4Increment)
        addDoneButtonOnNumpad(textField: player5Decrement)
        addDoneButtonOnNumpad(textField: player5Increment)
        addDoneButtonOnNumpad(textField: player6Decrement)
        addDoneButtonOnNumpad(textField: player6Increment)
        addDoneButtonOnNumpad(textField: player7Decrement)
        addDoneButtonOnNumpad(textField: player7Increment)
        addDoneButtonOnNumpad(textField: player8Decrement)
        addDoneButtonOnNumpad(textField: player8Increment)
        addDoneButtonOnNumpad(textField: player1Decrement)
        addDoneButtonOnNumpad(textField: player1Increment)
        addDoneButtonOnNumpad(textField: player2Decrement)
        addDoneButtonOnNumpad(textField: player2Increment)
        addDoneButtonOnNumpad(textField: player3Decrement)
        addDoneButtonOnNumpad(textField: player3Increment)
        addDoneButtonOnNumpad(textField: player4Decrement)
        addDoneButtonOnNumpad(textField: player4Increment)
        
    }

    @IBAction func viewHistoryBtn(_ sender: Any) {
        let historyView = storyboard?.instantiateViewController(identifier: "history") as! HistoryViewController
        historyView.history = history
        historyView.lines = lines
        historyView.nameTracker = self.nameTracker
        present(historyView, animated: true)
    }

    @IBAction func addPlayerBtn(_ sender: Any) {
        evaluatePlayers()
        playerViewEnable += 1
        if playerViewEnable > 0 && playerViewEnable < 8 {
            removePlayerBtn.isEnabled = true
            addPlayerBtn.isEnabled = true
        }
        switch playerViewEnable {
        case 1:
            player1View.isHidden = false
        case 2:
            player2View.isHidden = false
        case 3:
            player3View.isHidden = false
        case 4:
            player4View.isHidden = false
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
    
    @IBAction func rmvPlayerBtn(_ sender: Any) {
        evaluatePlayers()
        if playerViewEnable > 0 && playerViewEnable <= 8 {
            removePlayerBtn.isEnabled = true
            addPlayerBtn.isEnabled = true
        }
        switch playerViewEnable {
        case 1:
            player1View.isHidden = true
        case 2:
            player2View.isHidden = true
        case 3:
            player3View.isHidden = true
        case 4:
            player4View.isHidden = true
        case 5:
            player5View.isHidden = true
        case 6:
            player6View.isHidden = true
        case 7:
            player7View.isHidden = true
        case 8:
            player8View.isHidden = true
        default:
            removePlayerBtn.isEnabled = false
        }
        playerViewEnable -= 1
    }
    
    @objc func player1LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 1 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 1"]!.append(textField.text!)
                self.player1Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer1() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player1LabelTapped(_:)))
        player1Name.isUserInteractionEnabled = true
        player1Name.addGestureRecognizer(labelTap)
    }
    
    @objc func player2LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 2 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 2"]!.append(textField.text!)
                self.player2Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer2() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player2LabelTapped(_:)))
        player2Name.isUserInteractionEnabled = true
        player2Name.addGestureRecognizer(labelTap)
    }
    
    @objc func player3LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 3 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 3"]!.append(textField.text!)
                self.player3Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer3() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player3LabelTapped(_:)))
        player3Name.isUserInteractionEnabled = true
        player3Name.addGestureRecognizer(labelTap)
    }
    
    @objc func player4LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 4 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 4"]!.append(textField.text!)
                self.player4Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer4() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player4LabelTapped(_:)))
        player4Name.isUserInteractionEnabled = true
        player4Name.addGestureRecognizer(labelTap)
    }
    
    @objc func player5LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 5 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 5"]!.append(textField.text!)
                self.player5Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer5() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player5LabelTapped(_:)))
        player5Name.isUserInteractionEnabled = true
        player5Name.addGestureRecognizer(labelTap)
    }
    
    @objc func player6LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 6 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 6"]!.append(textField.text!)
                self.player6Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer6() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player6LabelTapped(_:)))
        player6Name.isUserInteractionEnabled = true
        player6Name.addGestureRecognizer(labelTap)
    }
    
    @objc func player7LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 7 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 7"]!.append(textField.text!)
                self.player7Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer7() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player7LabelTapped(_:)))
        player7Name.isUserInteractionEnabled = true
        player7Name.addGestureRecognizer(labelTap)
    }
    
    @objc func player8LabelTapped(_ sender: UITapGestureRecognizer) {
        print("Player 8 Tapped")
        let alert = UIAlertController(title: "Change Player Name", message: "Enter a name", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if textField.text! != "" {
                self.nameTracker["Player 8"]!.append(textField.text!)
                self.player8Name.text = textField.text!
            }
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
        
    func setupLabelTapPlayer8() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.player8LabelTapped(_:)))
        player8Name.isUserInteractionEnabled = true
        player8Name.addGestureRecognizer(labelTap)
    }
    
    @IBAction func player1AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player1Increment.resignFirstResponder()
        let add = player1Increment.text!
        playerScores["Player 1"]! += Int(add)!
        player1Score.text = "Score: \(playerScores["Player 1"]!)"
        history.append("\(nameTracker["Player 1"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player1MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player1Decrement.resignFirstResponder()
        let subtract = player1Decrement.text!
        playerScores["Player 1"]! -= Int(subtract)!
        player1Score.text = "Score: \(playerScores["Player 1"]!)"
        history.append("\(nameTracker["Player 1"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player2AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player2Increment.resignFirstResponder()
        let add = player2Increment.text!
        playerScores["Player 2"]! += Int(add)!
        player2Score.text = "Score: \(playerScores["Player 2"]!)"
        history.append("\(nameTracker["Player 2"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player2MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player2Decrement.resignFirstResponder()
        let subtract = player2Decrement.text!
        playerScores["Player 2"]! -= Int(subtract)!
        player2Score.text = "Score: \(playerScores["Player 2"]!)"
        history.append("\(nameTracker["Player 2"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player3AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player3Increment.resignFirstResponder()
        let add = player3Increment.text!
        playerScores["Player 3"]! += Int(add)!
        player3Score.text = "Score: \(playerScores["Player 3"]!)"
        history.append("\(nameTracker["Player 3"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player3MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player3Decrement.resignFirstResponder()
        let subtract = player3Decrement.text!
        playerScores["Player 3"]! -= Int(subtract)!
        player3Score.text = "Score: \(playerScores["Player 3"]!)"
        history.append("\(nameTracker["Player 3"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player4AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player4Increment.resignFirstResponder()
        let add = player4Increment.text!
        playerScores["Player 4"]! += Int(add)!
        player4Score.text = "Score: \(playerScores["Player 4"]!)"
        history.append("\(nameTracker["Player 4"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player4MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player4Decrement.resignFirstResponder()
        let subtract = player4Decrement.text!
        playerScores["Player 4"]! -= Int(subtract)!
        player4Score.text = "Score: \(playerScores["Player 4"]!)"
        history.append("\(nameTracker["Player 4"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player5AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player5Increment.resignFirstResponder()
        let add = player5Increment.text!
        playerScores["Player 5"]! += Int(add)!
        player5Score.text = "Score: \(playerScores["Player 5"]!)"
        history.append("\(nameTracker["Player 5"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player5MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player5Decrement.resignFirstResponder()
        let subtract = player5Decrement.text!
        playerScores["Player 5"]! -= Int(subtract)!
        player5Score.text = "Score: \(playerScores["Player 5"]!)"
        history.append("\(nameTracker["Player 5"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player6AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player6Increment.resignFirstResponder()
        let add = player6Increment.text!
        playerScores["Player 6"]! += Int(add)!
        player6Score.text = "Score: \(playerScores["Player 6"]!)"
        history.append("\(nameTracker["Player 6"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player6MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player6Decrement.resignFirstResponder()
        let subtract = player6Decrement.text!
        playerScores["Player 6"]! -= Int(subtract)!
        player6Score.text = "Score: \(playerScores["Player 6"]!)"
        history.append("\(nameTracker["Player 6"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player7AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player7Increment.resignFirstResponder()
        let add = player7Increment.text!
        playerScores["Player 7"]! += Int(add)!
        player7Score.text = "Score: \(playerScores["Player 7"]!)"
        history.append("\(nameTracker["Player 7"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player7MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player7Decrement.resignFirstResponder()
        let subtract = player7Decrement.text!
        playerScores["Player 7"]! -= Int(subtract)!
        player7Score.text = "Score: \(playerScores["Player 7"]!)"
        history.append("\(nameTracker["Player 7"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player8AddBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player8Increment.resignFirstResponder()
        let add = player8Increment.text!
        playerScores["Player 8"]! += Int(add)!
        player8Score.text = "Score: \(playerScores["Player 8"]!)"
        history.append("\(nameTracker["Player 8"]!.last!) gained \(add) life \n")
        lines += 1
        evaluate()
    }

    @IBAction func player8MinusBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = false
        removePlayerBtn.isEnabled = false
        player8Decrement.resignFirstResponder()
        let subtract = player8Decrement.text!
        playerScores["Player 8"]! -= Int(subtract)!
        player8Score.text = "Score: \(playerScores["Player 8"]!)"
        history.append("\(nameTracker["Player 8"]!.last!) lost \(subtract) life \n")
        lines += 1
        evaluate()
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        addPlayerBtn.isEnabled = true
        removePlayerBtn.isEnabled = true
        player1Name.text = "Player 1"
        player2Name.text = "Player 2"
        player3Name.text = "Player 3"
        player4Name.text = "Player 4"
        player5Name.text = "Player 5"
        player6Name.text = "Player 6"
        player7Name.text = "Player 7"
        player8Name.text = "Player 8"
        player1Score.text = "Score: 20"
        player2Score.text = "Score: 20"
        player3Score.text = "Score: 20"
        player4Score.text = "Score: 20"
        player5Score.text = "Score: 20"
        player6Score.text = "Score: 20"
        player7Score.text = "Score: 20"
        player8Score.text = "Score: 20"
        player1AddBtn.isEnabled = true
        player1MinusBtn.isEnabled = true
        player2AddBtn.isEnabled = true
        player2MinusBtn.isEnabled = true
        player3AddBtn.isEnabled = true
        player3MinusBtn.isEnabled = true
        player4AddBtn.isEnabled = true
        player4MinusBtn.isEnabled = true
        player5AddBtn.isEnabled = true
        player5MinusBtn.isEnabled = true
        player6AddBtn.isEnabled = true
        player6MinusBtn.isEnabled = true
        player7AddBtn.isEnabled = true
        player7MinusBtn.isEnabled = true
        player8AddBtn.isEnabled = true
        player8MinusBtn.isEnabled = true
        player1Decrement.isEnabled = true
        player1Increment.isEnabled = true
        player2Decrement.isEnabled = true
        player2Increment.isEnabled = true
        player3Decrement.isEnabled = true
        player3Increment.isEnabled = true
        player4Decrement.isEnabled = true
        player4Increment.isEnabled = true
        player5Decrement.isEnabled = true
        player5Increment.isEnabled = true
        player6Decrement.isEnabled = true
        player6Increment.isEnabled = true
        player7Decrement.isEnabled = true
        player7Increment.isEnabled = true
        player8Decrement.isEnabled = true
        player8Increment.isEnabled = true
        player1Decrement.text = ""
        player1Increment.text = ""
        player2Decrement.text = ""
        player2Increment.text = ""
        player3Decrement.text = ""
        player3Increment.text = ""
        player4Decrement.text = ""
        player4Increment.text = ""
        player5Decrement.text = ""
        player5Increment.text = ""
        player6Decrement.text = ""
        player6Increment.text = ""
        player7Decrement.text = ""
        player7Increment.text = ""
        player8Decrement.text = ""
        player8Increment.text = ""
        player1View.isHidden = false
        player2View.isHidden = false
        player3View.isHidden = false
        player4View.isHidden = false
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
        playerViewEnable = 4
        lines = 0
        history = []
        nameTracker = ["Player 1": ["Player 1"],
                       "Player 2": ["Player 2"],
                       "Player 3": ["Player 3"],
                       "Player 4": ["Player 4"],
                       "Player 5": ["Player 5"],
                       "Player 6": ["Player 6"],
                       "Player 7": ["Player 7"],
                       "Player 8": ["Player 8"]]
    }
    
    func evaluate() {
        for (player, life) in playerScores {
            if life <= 0 {
                print("lost")
                endGameMessage.text = "\(nameTracker[player]!.last!) lost the game!"
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
    
    func evaluatePlayers() {
        if playerViewEnable <= 0 {
            playerViewEnable = 0
            addPlayerBtn.isEnabled = true
            removePlayerBtn.isEnabled = false
        } else if playerViewEnable >= 8 {
            playerViewEnable = 8
            addPlayerBtn.isEnabled = false
            removePlayerBtn.isEnabled = true
        } else {
            addPlayerBtn.isEnabled = true
            removePlayerBtn.isEnabled = true
        }
    }
    
    func addDoneButtonOnNumpad(textField: UITextField) {
            let keypadToolbar: UIToolbar = UIToolbar()
            
            // add a done button to the numberpad
            keypadToolbar.items=[
                UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(UITextField.resignFirstResponder)),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
            ]
            keypadToolbar.sizeToFit()
        
            // add a toolbar with a done button above the number pad
            textField.inputAccessoryView = keypadToolbar
    }//addDoneToKeyPad
    
}

