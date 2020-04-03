//
//  EndPoints.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 31.03.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation

enum EndPoints {
    case baseUrl
    case popular(key: String, page: Int)
    case baseUrlPic(size: Int)

    
    var path: String {
        switch self {
        case .baseUrl:
            return "https://api.themoviedb.org/3/"
        case .popular(let key, let page):
            return "tv/popular?api_key=\(key)&language=en-US&page=\(page)"
        case .baseUrlPic(let size):
            return "https://image.tmdb.org/t/p/w\(size)"
        }
    }
}
