//
//  Message.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 2.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation

struct Message<T: Decodable>: Decodable{
    var message: String?
    var messageType, enumerationType: Int?
    var data: T?
    var messageStatus: Int?
    private enum CodingKeys: String, CodingKey {
        case message
        case messageType
        case data
        case enumerationType
        case messageStatus
    }
}

extension Message: Modelable {
    init(data: Data) {
        do {
            let me = try JSONDecoder().decode(Message.self, from: data)
            self = me
        }
        catch {
            print(error)
        }
    }
}
