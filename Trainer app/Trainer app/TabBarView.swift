//
//  TabBarView.swift
//  Trainer app
//
//  Created by yunus on 07.09.2024.
//

import UIKit
import SnapKit

class TabBarView: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
    }
    
    private func setTabs(){
        let mainVC = MainViewController()
        mainVC.tabBarItem.title = "Main"
        mainVC.tabBarItem.image = UIImage(systemName: "house.circle")
        
        let categoryVC = CategoryViewController()
        categoryVC.tabBarItem.title = "Category"
        categoryVC.tabBarItem.image = UIImage(systemName: "list.bullet.circle")
        
        let registeredVC = RegisteredViewController()
        registeredVC.tabBarItem.title = "Registered"
        registeredVC.tabBarItem.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
        
        setViewControllers([mainVC, categoryVC, registeredVC], animated: true)
    }
}
