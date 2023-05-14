//
//  Keywords.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 11/05/2023.
//

import Foundation

struct Keywords: Codable {
    
    var id: Int64?
    var keywords: [Keyword]?
}

struct Keyword: Codable {
    
    var id: Int64?
    var name: String?
}
