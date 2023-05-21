//
//  TvDetail.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 19/05/2023.
//

import Foundation

struct TvSeriesDetail: Codable {
    
    var adult: Bool?
    var backdrop_path: String?
    var created_by: [CreatedBy]?
    var episode_run_time: [Int]?
    var first_air_date: String?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var in_production: Bool?
    var languages: [String]?
    var last_air_date: String?
    var last_episode_to_air: LastEpisodeToAir?
    var name: String?
    var next_episode_to_air: String?
    var networks: [Network]?
    var number_of_episodes: Int?
    var number_of_seasons: Int?
    var origin_country: [String]?
    var original_language: String?
    var original_name: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [ProductionCompany]?
    var production_countries: [ProductionCountry]?
    var seasons: [Season]?
    var spoken_languages: [SpokenLanguage]?
    var status: String?
    var tagline: String?
    var type: String?
    var vote_average: Double?
    var vote_count: Int?
}

struct CreatedBy: Codable {
    
    var id: Int?
    var credit_id: String?
    var name: String?
    var gender: Int?
    var profile_path: String?
}

struct LastEpisodeToAir: Codable {
    
    var id: Int?
    var name: String?
    var overview: String?
    var vote_average: Double?
    var vote_count: Int?
    var air_date: String?
    var episode_number: Int?
    var production_code: String?
    var runtime: Int?
    var season_number: Int?
    var show_id: Int?
    var still_path: String?
}

struct Network: Codable {
    
    var id: Int?
    var logo_path: String?
    var name: String?
    var origin_country: String?
}

struct Season: Codable {
    
    var air_date: String?
    var episode_count: Int?
    var id: Int?
    var name: String?
    var overview: String?
    var poster_path: String?
    var season_number: Int?
}

