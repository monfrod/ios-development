//
//  ViewController.swift
//  Right on target
//
//  Created by yunus on 20.11.2023.
//

import UIKit

class ViewController: UIViewController {
    override func loadView(){
        super.loadView()
        print("loadView")
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 5, width: 200, height: 50))
        
        versionLabel.text = "Версия 1.1"
        
        view.addSubview(versionLabel)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
    }
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    var number: Int = 0
    var round: Int = 0
    var point: Int = 0
    @IBAction func CheckNumber(){
//        if self.round == 0 {
//            self.number = Int.random(in: 1...50)
//            self.label.text = String(self.number)
//            self.round = 1
//        }
//        else {
            let numSlider = Int(self.slider.value.rounded())
            if numSlider > self.number{
                self.point += 50 - numSlider+self.number
            }
            else if numSlider < self.number{
                self.point += 50 - self.number+numSlider
            }
            else{
                self.point += 50
            }
            if self.round == 5{
                let alert = UIAlertController(title: "Игра окончена!",
                                              message: "Вы заработали \(self.point) очков!",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.point = 0
            }
            else{
                self.round += 1
            }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
//        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        self.round = 1
        // Do any additional setup after loading the view.
    }


}

