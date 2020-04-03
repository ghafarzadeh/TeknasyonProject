//
//  PopularService.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 2.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

typealias PopularLoaded = (PopularList?, RequestManager.RequestError?)

protocol PopularServiceProtocol {
    func loadProfile() -> Observable<PopularLoaded>
}

var key: String {
    get {
        return "21e3a696dce350e63b866ab6c7a86e88"
    }
}

class PopularService: PopularServiceProtocol {

    private let requestManager = RequestManager.shared
    
    func loadProfile() -> Observable<PopularLoaded> {
        return self.requestManager.rxget(url: EndPoints.popular(key: key, page: 1).path) as
            Observable<PopularLoaded>
    }

}
