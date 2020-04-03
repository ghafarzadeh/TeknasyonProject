//
//  Result2.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 2.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation

struct Result2<T: Decodable>: Decodable {
    let messages: [T]?
    var innerMessageClass : T?
    var enumerationType : Int?
    let hasError, hasWarning: Bool?
}
