//
//  Recipe.swift
//  Assignment3-UI
//
//  Created by Kanchan Kaur on 2024-11-15.
//

import Foundation

struct Recipe: Identifiable, Codable {
    // Using _id for the unique identifier from the API response
    var id: String {
        return _id
    }
    
    // Only the required properties
    let _id: String // The unique identifier (_id from the JSON)
    let recipeName: String
    let cuisine: String
    let averageRating: Double
    
    // Codable conformance to handle JSON decoding
    enum CodingKeys: String, CodingKey {
        case _id
        case recipeName
        case cuisine
        case averageRating
    }
}



