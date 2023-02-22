//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 60
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.currentTitle else {return}
        hardnessHandle(hardness: hardness)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    private func hardnessHandle(hardness: String){
        if let hardnessTime = self.eggTimes[hardness] {
            switch hardness {
                case "Soft":
                    print(hardnessTime)
                case "Medium":
                    print(hardnessTime)
                case "Hard":
                    print(hardnessTime)
                default:
                    print("No time for this hardness")
            }
        }
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
        }
    }
}
