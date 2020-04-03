//
//  PopularList.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 31.03.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation

struct PopularList: Codable {
    var page, totalResults, totalPages: Int?
    var results: [ResultList]?
//    var status_code: Int?
//    var status_message: String?
//    var success: Bool?
    

    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
//        case statusCode = "status_code"
//        case statusMessage = "status_message"
//        case success = "success"
    }
}

extension PopularList: Modelable {
    init(data: Data) {
        do {
            let map = try JSONDecoder().decode(PopularList.self, from: data)
            print("")
            self = map
        }
        catch {
            print(error)
        }
    }
}
