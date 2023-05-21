//
//  Tv.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 19/05/2023.
//

import Foundation

struct TvSeries: Codable {
    
    var backdrop_path: String?
    var first_air_date: String?
    var genre_ids: [Int]?
    var id: Int?
    var name: String?
    var origin_country: [String]?
    var original_language: String?
    var original_name: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var vote_count: Int?
    var vote_average: Double?
}
