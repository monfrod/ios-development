//
//  ViewController.swift
//  Netflix clone
//
//  Created by yunus on 09.12.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
        vc1.tabBarItem.image = UIImage(systemName: "house.circle.fill")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle.fill")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle.fill")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.circle.fill")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
    }

}

