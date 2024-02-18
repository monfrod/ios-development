//
//  SecondViewController.swift
//  VasiliyUsovBook
//
//  Created by yunus on 18.11.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var MyLabel: UILabel!
    
    
    @IBAction func GET_ALERT(){
        let alert = UIAlertController(
            title: "Alert1",
            message: "You pressed get alert",
            preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK",
                                    style: .default)
        alert.addAction(alertOK)
        self.present(alert, animated: true)
    }
    @IBAction func ChangeLabelText(_ sender: UIButton) {
        if let buttomText = sender.titleLabel!.text{
            self.MyLabel.text = "\(buttomText) button was pressed"
        }
    }
    
    
}
