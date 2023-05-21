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
        
        let movieTab = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Main.Movie.rawValue) as? MovieViewController ?? MovieViewController()
        movieTab.tabBarItem = UITabBarItem(title: .movie, image: UIImage(systemName: "film"), selectedImage: UIImage(systemName: "film"))
        
        let tvShowTab = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Main.TvSeries.rawValue) as? TvSeriesViewController ?? TvSeriesViewController()
        tvShowTab.tabBarItem = UITabBarItem(title: .tv, image: UIImage(systemName: "tv"), selectedImage: UIImage(systemName: "tv"))

        tabBar.backgroundColor = .backgroundColor
        tabBar.barTintColor = .backgroundColor
        tabBar.tintColor = .white

        setViewControllers([movieTab, tvShowTab], animated: true)
    }
    
}
