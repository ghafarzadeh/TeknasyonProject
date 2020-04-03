//
//  Paging.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 3.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation

class Paging {
    var threshold: Int
    var offset: Int
    var limit: Int
    
    init(limit: Int) {
        self.threshold = 5
        self.offset = 1
        self.limit = limit
    }
}
