//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain  = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    @IBAction func answerButtonAction(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let answerUser = quizBrain.checkAnswer(userAnswer)
        if answerUser{
            sender.backgroundColor = UIColor(red: 209, green: 247, blue: 9, alpha: 1.0)
        } else {
            sender.backgroundColor = UIColor.red
        }
//        if quizNumber + 1 < quiz.count{
//            quizNumber += 1
//        }else{
//            quizNumber = 0
//        }
//        print(quiz[quizNumber].answer)
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        }

}
