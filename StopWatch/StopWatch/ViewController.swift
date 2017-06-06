//
//  ViewController.swift
//  StopWatch
//
//  Created by Dylan Frankcom on 2016-06-23.
//  Copyright © 2016 Dylan Frankcom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = Timer()
    var timerIsRunning = false
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerDisplay: UILabel!
    
    
    // Starts the timer and updates display
    @IBAction func startButton(_ sender: UIButton) {
       if timerIsRunning{
            return
        }
        timerIsRunning = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    
    }
    
    // Pauses the timer and display
    @IBAction func pauseButton(_ sender: UIButton) {
        timer.invalidate()
        timerIsRunning = false
    
    }
    
    // Resets the timer and display
    @IBAction func resetButton(_ sender: UIButton) {
        timer.invalidate()
        counter = 0.0
        timerIsRunning = false
        timerDisplay.text = "\(counter)"
    
    }
    
    // Set the Status Bar colour to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    
    }
    
    // Update counter and timerDisplay
    @objc func updateTimer() {
        counter = counter + 0.1
        timerDisplay.text = String(format: "%.1f", counter) // Looking for a swiftier way to format.
    
    }

}
