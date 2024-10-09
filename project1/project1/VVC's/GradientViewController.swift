//
//  GradientViewController.swift
//  project1
//
//  Created by yunus on 07.10.2024.
//
import UIKit

class GradientViewController: UIViewController {

    let gradientView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    private func setupGradientBackground() {
        gradientView.frame = view.bounds
        view.addSubview(gradientView)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.systemFill.cgColor, UIColor.systemMint.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientView.layer.addSublayer(gradientLayer)
       // tableView.backgroundView = gradientView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientView.frame = view.bounds
    }
   
}
