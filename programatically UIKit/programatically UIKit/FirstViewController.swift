//
//  ViewController.swift
//  programatically UIKit
//
//  Created by yunus on 14.09.2024.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        label.text = "first scene"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(50)
            make.top.equalTo(view.snp.top).offset(100)
        }
        button.setTitle("go next screen", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
        }
        
        
    }
    @objc func buttonTapped(){
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}

