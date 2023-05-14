//
//  Credits.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 11/05/2023.
//

import Foundation

struct Credits: Codable {
    
    var id: Int64?
    var cast: [Cast]?
    var crew: [Crew]?
}

struct Cast: Codable {
    
    var adult: Bool?
    var gender: Int?
    var id: Int64?
    var known_for_department: String?
    var name: String?
    var original_name: String?
    var popularity: Double?
    var profile_path: String?
    var cast_id: Int?
    var character: String?
    var credit_id: String?
    var order: Int?
}

struct Crew: Codable {
    
    var adult: Bool?
    var gender: Int?
    var id: Int64?
    var known_for_department: String?
    var name: String?
    var original_name: String?
    var popularity: Double?
    var profile_path: String?
    var credit_id: String?
    var department: String?
    var job: String?
}
