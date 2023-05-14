//
//  MovieResult.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 03/05/2023.
//

import Foundation

struct MovieResult: Codable {
    
    var page: Int?
    var total_pages: Int?
    var total_results: Int?
    var results: [Movie]?
}
