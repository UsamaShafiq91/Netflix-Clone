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
    case Movie = "MovieViewController"
    case MovieDetail = "MovieDetailViewController"
    
    case TvSeries = "TvSeriesViewController"
    case TvSeriesDetail = "TvSeriesDetailViewController"
    case SeasonDetail = "SeasonDetailViewController"
}

