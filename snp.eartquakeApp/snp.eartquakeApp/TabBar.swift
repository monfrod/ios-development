//
//  TabBar.swift
//  snp.eartquakeApp
//
//  Created by yunus on 23.09.2024.
//

import UIKit

class TabBar: UITabBarController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setTabs()
    }
    private func setTabs(){
        let firstVC = UINavigationController(rootViewController: FirstViewController())
        firstVC.tabBarItem.title = "Map"
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem.title = "All earthquake"
        
        let loginVC = LogInViewController()
        loginVC.tabBarItem.title = "Log in"
        
        setViewControllers([firstVC, secondVC, loginVC], animated: true)
    }
}
