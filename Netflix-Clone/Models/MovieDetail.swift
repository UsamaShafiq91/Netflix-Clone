//
//  MovieDetail.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 10/05/2023.
//

import Foundation

struct MovieDetail: Codable {
    
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: BelongsToCollection?
    var budget: Int64?
    var genres: [Genre]?
    var homepage: String?
    var id: Int64?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [ProductionCompany]?
    var production_countries: [ProductionCountry]?
    var release_date: String?
    var revenue: Int64?
    var runtime: Int64?
    var spoken_languages: [SpokenLanguage]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int64?
}

struct BelongsToCollection: Codable {
    
    var id: Int?
    var name: String?
    var poster_path: String?
    var backdrop_path: String?
}

struct Genre: Codable {
    
    var id: Int?
    var name: String?
}

struct ProductionCompany: Codable {
    
    var id: Int?
    var name: String?
    var logo_path: String?
    var origin_country: String?
}

struct ProductionCountry: Codable {
    
    var iso_3166_1: String?
    var name: String?
}

struct SpokenLanguage: Codable {
    
    var english_name: String?
    var iso_639_1: String?
    var name: String?
}
