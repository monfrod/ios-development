//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageOne: UIImageView!
    @IBOutlet weak var diceImageTwo: UIImageView!
    
    var leftDiceNumber = 1
    var rightDiceNumber = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonRule(_ sender: UIButton) {
        leftDiceNumber = Int.random(in: 0...5)
        rightDiceNumber = Int.random(in: 0...5)
        diceImageOne.image = [UIImage(imageLiteralResourceName: "DiceOne"),
                              UIImage(imageLiteralResourceName: "DiceTwo"),
                              UIImage(imageLiteralResourceName: "DiceThree"),
                              UIImage(imageLiteralResourceName: "DiceFour"),
                              UIImage(imageLiteralResourceName: "DiceFive"),
                              UIImage(imageLiteralResourceName: "DiceSix")][leftDiceNumber]
        diceImageTwo.image = [UIImage(imageLiteralResourceName: "DiceOne"),
                              UIImage(imageLiteralResourceName: "DiceTwo"),
                              UIImage(imageLiteralResourceName: "DiceThree"),
                              UIImage(imageLiteralResourceName: "DiceFour"),
                              UIImage(imageLiteralResourceName: "DiceFive"),
                              UIImage(imageLiteralResourceName: "DiceSix")][rightDiceNumber]
    }
    
    


}

