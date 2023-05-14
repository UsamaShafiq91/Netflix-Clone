//
//  UIStoryboard+Extension.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 09/05/2023.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

enum Main: String {
    case Home = "HomeViewController"
    case MovieDetail = "MovieDetailViewController"
}

