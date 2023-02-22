//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var stopButton: UIButton!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var audioPlayer: AVAudioPlayer?

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        resetApp()
        
        guard let hardness = sender.currentTitle else {return}
        hardnessHandle(hardness: hardness)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    private func hardnessHandle(hardness: String){
        timer.invalidate()
        stopButton.isHidden = false
        guard let hardnessTime = eggTimes[hardness] else {return}
        self.totalTime = hardnessTime
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            self.progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            self.titleLabel.text = "Egg Done"
            playAlert()
            stopButton.isHidden = true
        }
    }
    
    private func resetApp() {
        timer.invalidate()
        stopButton.isHidden = true
        self.titleLabel.text = "How do you like your eggs?"
        self.progressBar.progress = 0.0
        self.secondsPassed = 0
        self.totalTime = 0
    }
    
    private func playAlert() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer?.play()
    }
    @IBAction func stopButton(_ sender: UIButton) {
        resetApp()
    }
}
