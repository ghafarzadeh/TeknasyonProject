//
//  PopularListVM.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 1.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
import RxSwift
import XCoordinator
import RxCocoa

protocol PopularListVMInput {
    var itemLoadTrigger: AnyObserver<ResultList> { get }
}

protocol PopularListVMOutput {
    var listItems: BehaviorRelay<[ResultList]> { get }
    var popularList: [ResultList] { get set}
    var isLoading: Bool { get set}
    func getList(page: Int)
}

protocol PopularListVM {
    var input: PopularListVMInput { get }
    var output: PopularListVMOutput { get }
}

extension PopularListVM where Self: PopularListVMInput & PopularListVMOutput {
    var input: PopularListVMInput { return self }
    var output: PopularListVMOutput { return self }
}
