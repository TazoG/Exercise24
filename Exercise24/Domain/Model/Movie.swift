//
//  Movie.swift
//  Exercise24
//
//  Created by Mariam Joglidze on 26.02.23.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let image:  String
    let title: String

    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "poster_path"
        case title = "original_title"
    }
}

struct Response: Codable {
  let results: [Movie]
}
