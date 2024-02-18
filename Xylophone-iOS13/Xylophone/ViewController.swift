//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    func playSound(name nameSound: String) {
        let url = Bundle.main.url(forResource: "\(nameSound)", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            playSound(name: buttonTitle)
            sender.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                sender.alpha = 1
                }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

