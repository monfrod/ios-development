//
//  SecondViewController.swift
//  Right on target
//
//  Created by yunus on 01.12.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("viewDidLoad2")
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        print("viewDidAppear2")
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("viewWillAppear2")
    }
    override func loadView() {
        super.loadView()
        print("loadView2")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear2")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear2")
    }
    
}
