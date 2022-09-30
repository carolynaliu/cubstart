//
//  ViewController.swift
//  CounterApp
//
//  Created by Carolyn Liu on 9/28/22.
//

import UIKit

class ViewController: UIViewController {
    var countNum = 0
    var goal = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count.text = String(countNum)
    }
    
    @IBOutlet weak var count: UILabel!
    
    @IBAction func decrement(_ sender: Any) {
        countNum = countNum - 1
        count.text = String(countNum)
        checkGoal()
    }
    
    @IBAction func increment(_ sender: Any) {
        countNum = countNum + 1
        count.text = String(countNum)
        checkGoal()
    }
    
    @IBAction func hundred(_ sender: Any) {
        countNum = 100
        count.text = String(countNum)
    }
    
    //check that the countNum = goal. if it is, change count text to "GOAL"
    func checkGoal() {
        if countNum == goal {
            count.text = "GOAL"
        }
    }
}

