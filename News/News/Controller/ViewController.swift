//
//  ViewController.swift
//  News
//
//  Created by yunus on 25.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NewsManager().fetchNews()
    }

}
