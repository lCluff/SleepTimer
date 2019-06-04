//
//  ViewController.swift
//  SleepTimer
//
//  Created by Leah Cluff on 5/7/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class PowerNapViewController: UIViewController {
    
    @IBOutlet weak var toggleTimerButton: UIButton!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    let myTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func updateView() {
        timeRemainingLabel.text = myTimer.timeAsString
        if myTimer.isOn {
            toggleTimerButton.setTitle("Cancel", for: .normal)
        }else {
            toggleTimerButton.setTitle("Nap Time!", for: .normal)
            
        }
    }
    @IBAction func toggleTimerButtonTapped(_ sender: Any) {
        if myTimer.isOn {
            myTimer.stopTimer()
        }else{
            myTimer.Startimer(time: 5)
        }
    }
}
