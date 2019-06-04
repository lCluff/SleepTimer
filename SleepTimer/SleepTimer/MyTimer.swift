//
//  MyTimer.swift
//  SleepTimer
//
//  Created by Leah Cluff on 5/7/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class MyTime: NSObject{
    var timeRemaining: TimeInterval?
    var timer:Timer?
    var isOn: Bool{
        return timeRemaining != nil
        
    }
    var timeAsString: String {
        let timeRemaining = Int(self.timeRemaining ?? 20 * 60)
        let minutesRemaining = timeRemaining / 60
        let secondsRemaining = timeRemaining - (minutesRemaining * 60)
        return String(format: "%02d : %02d", arguments: [minutesRemaining, secondsRemaining])
    }
    func secondTick(){
        guard let unwrappedTimeRemaining = timeRemaining else {return}
        if unwrappedTimeRemaining > 0 {
            self.timeRemaining = unwrappedTimeRemaining - 1
        } else {timer?.invalidate()
            self.timeRemaining = nil
        }
    }
    
    func startTimer(time: TimeInterval) {
        if !isOn {
            timeRemaining = time
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                    self.secondTick()
                    
                })
            }
        }
        func stopTimer() {
            timeRemaining = nil 
        }
    }
}
