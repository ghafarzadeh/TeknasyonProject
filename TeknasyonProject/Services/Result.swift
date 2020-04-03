//
//  Result.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 2.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
struct Result<T: Decodable>: Decodable {
    var status_code: Int?
    var status_message: String?
    var success: Bool?
    var messages: T?
//    var innerMessageClass : Result2<T>?
//    var hasError, hasWarning: Bool?
    init(messages: T?,
        status_code: Int?,
        success: Bool,
        status_message: String) {
        self.messages = messages
        self.status_code = status_code
        self.status_message = status_message
        self.success = success

    }
}

extension Result: Modelable {
    init(data: Data) {
        do {
            let map = try JSONDecoder().decode(Result.self, from: data)
            print("")
            self = map
            guard map.success == nil else {
                messages = nil
                status_code = map.status_code
                status_message = map.status_message
                success = map.success
                return
            }
        }
        catch {
            print(error)
            self.messages = nil
        }
    }
}
