//
//  TabBarController.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/01.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpControllers()
    }
    
    private func setUpControllers() {
        let home = HomeViewController()
        let podcast = PodcastViewController()
        let search = SearchViewController()
        let profile = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: podcast)
        let nav3 = UINavigationController(rootViewController: search)
        let nav4 = UINavigationController(rootViewController: profile)
        
        nav1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 4)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
    }
}
