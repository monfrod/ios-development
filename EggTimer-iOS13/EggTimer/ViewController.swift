//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 30, "Medium": 7, "Hard": 12]
    var player: AVAudioPlayer?
    var totalTime:Float = 0
    var secondsPassed:Float = 0

    func playSound(){
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    var timer = Timer()
    
    
    @IBAction func stopButoon(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = "Choose one version egg do you like"
        
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        print("Button ")
        timer.invalidate()
        progressBar.progress = 0.0
        let hardness = sender.currentTitle!
        
        totalTime = Float(eggTimes[hardness]!)
        secondsPassed = 0
        titleLabel.text = "\(hardness)"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
         

    }
    @objc func updateTimer (){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress:Float = Float(secondsPassed/totalTime)
            print(percentageProgress)
            progressBar.progress = percentageProgress
        } else{
            timer.invalidate()
            playSound()
            titleLabel.text = "Done!"
        }
    }
    

}
