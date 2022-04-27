//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Christopher Ku on 4/25/22.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var historyLog: UILabel!
    var history : [String] = []
    var lines : Int = 0
    var buildString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for message in history {
            buildString += message
        }
        historyLog.numberOfLines = lines
        historyLog.text = buildString
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
