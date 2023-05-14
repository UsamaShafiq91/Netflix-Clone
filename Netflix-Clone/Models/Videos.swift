//
//  Videos.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 14/05/2023.
//

import Foundation

struct Videos: Codable {
    
    var id: Int64?
    var results: [Video]?
}

struct Video: Codable {
    
    var iso_639_1: String?
    var iso_3166_1: String?
    var name: String?
    var key: String?
    var site: String?
    var size: Int64?
    var type: String?
    var official: Bool?
    var published_at: String?
    var id: String?
}
