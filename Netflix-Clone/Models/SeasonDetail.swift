//
//  SeasonDetail.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 21/05/2023.
//

import Foundation

struct SeasonDetail: Codable {
    
    var _id: String?
    var air_date: String?
    var episodes: [Episode]?
    var name: String?
    var overview: String?
    var id: Int?
    var poster_path: String?
    var season_number: Int?
}

struct Episode: Codable {
    
    var air_date: String?
    var episode_number: Int?
    var id: Int?
    var name: String?
    var overview: String?
    var production_code: String?
    var runtime: Int?
    var season_number: Int?
    var show_id: Int?
    var still_path: String?
    var vote_average: Double?
    var vote_count: Int?
    var crew: [Crew]?
    var guest_stars: [GuestStar]?
}

struct GuestStar: Codable {
    
    var character: String?
    var credit_id: String?
    var order: Int?
    var adult: Bool?
    var gender: Int?
    var id: Int?
    var known_for_department: String?
    var name: String?
    var original_name: String?
    var profile_path: String?
    var popularity: Double?

}
