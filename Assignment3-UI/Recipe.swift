//
//  Recipe.swift
//  Assignment3-UI
//
//  Created by Kanchan Kaur on 2024-11-15.
//

import Foundation

struct Recipe: Identifiable, Codable {

    var id: String {
        return _id
    }
    

    let _id: String
    let recipeName: String
    let cuisine: String
    let averageRating: Double
    
    
    enum CodingKeys: String, CodingKey {
        case _id
        case recipeName
        case cuisine
        case averageRating
    }
}



