//
//  ResultList.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 31.03.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation

struct ResultList: Codable {
    let originalName: String
    let name: String
    let popularity: Double
    let voteCount: Int
    let id: Int
    let voteAverage: Double
    var poster_path, backdrop_path: String?
    var original_language, overview: String?

    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case name, popularity
        case voteCount = "vote_count"
        case id
        case voteAverage = "vote_average"
        case poster_path, backdrop_path, original_language, overview
    }
}
