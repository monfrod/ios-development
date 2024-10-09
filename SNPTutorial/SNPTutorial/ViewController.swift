//
//  ViewController.swift
//  SNPTutorial
//
//  Created by yunus on 22.08.2024.
//
import SnapKit
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}

class ViewController: UIViewController {

    let greenRectangle = UIView()
    let MagicCoffeLabel = UILabel()
    let feelLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        greenRectangle.backgroundColor = UIColor(hex: "324A59")
        view.addSubview(greenRectangle)
        greenRectangle.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top).offset(98)
            make.height.equalTo(323)
            make.width.equalTo(375)
        }
        
        MagicCoffeLabel.text = "Magic coffee"
        MagicCoffeLabel.font = UIFont(name: "Marker Felt", size: 64)
        view.addSubview(MagicCoffeLabel)
        MagicCoffeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.top).offset(313)
        }
        
        feelLabel.text = "Feel yourself like a barista!"
        feelLabel.textColor = UIColor(hex: "181D2D")
        feelLabel.font = UIFont(name: "Helvetica Neue", size: 28)
        feelLabel.font = UIFont.systemFont(ofSize: 28, weight: .light)
        feelLabel.textAlignment = .center
        feelLabel.numberOfLines = 0
        view.addSubview(feelLabel)
        feelLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(446)
            make.centerX.equalTo(view)
            make.width.equalTo(239)
            make.height.equalTo(81)
        }
        
    }
}

