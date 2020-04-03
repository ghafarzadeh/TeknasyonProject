//
//  PopularDetailVMImpl.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 3.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
import Action
import RxSwift
import XCoordinator
import RxCocoa

class PopularDetailVMImpl: PopularDetailVM, PopularDetailVMInput, PopularDetailVMOutput {
    
    var list: ResultList

    var responseLoaded = PublishSubject<String>()
    
    private let router: AnyRouter<AppRoute>
    
    init(_ route: AnyRouter<AppRoute>, list: ResultList) {
       // self.selectableType = selectableType
        self.router = route
        self.list = list
    }
}
