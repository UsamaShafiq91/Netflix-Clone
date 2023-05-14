//
//  Category.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 08/05/2023.
//

import Foundation

enum CategoryType: String {
    case movie = "movie"
    case tvShow = "tvShow"
}

struct Category: Codable {
    
    var name: String
    var type: String
    var path: String
}
