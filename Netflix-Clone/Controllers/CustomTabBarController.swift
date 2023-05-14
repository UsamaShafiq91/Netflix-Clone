//
//  CustomTabBarController.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 07/05/2023.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let homeTab = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Main.Home.rawValue) as? HomeViewController ?? HomeViewController()
//        homeTab.tabBarItem.image = UIImage(systemName: "house")
//        
//        UIImage(named: "Dashboard-Grey").tint

        homeTab.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house")?.withTintColor(.red))


//        let tab2 = UINavigationController(rootViewController: UpcomingViewController())
//        let tab3 = UINavigationController(rootViewController: SearchViewController())
//        let tab4 = UINavigationController(rootViewController: DownloadViewController())
//
//        tab2.tabBarItem.image = UIImage(systemName: "play.circle")
//        tab3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//        tab4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
//
//        tab1.title = "Home"
//        tab2.title = "Upcoming"
//        tab3.title = "Top Search"
//        tab4.title = "Downloads"
        tabBar.tintColor = .label

        setViewControllers([homeTab], animated: true)

    }
    
}
