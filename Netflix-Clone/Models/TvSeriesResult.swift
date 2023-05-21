//
//  TvResult.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 19/05/2023.
//

import Foundation

struct TvSeriesResult: Codable {
    
    var page: Int?
    var total_pages: Int?
    var total_results: Int?
    var results: [TvSeries]?
}
