//
//  PopularDetailVM.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 3.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
import RxSwift
import XCoordinator

protocol PopularDetailVMInput {
    var list: ResultList { get }
}

protocol PopularDetailVMOutput {
    var responseLoaded : PublishSubject<String> { get }
}

protocol PopularDetailVM {
    var input: PopularDetailVMInput { get }
    var output: PopularDetailVMOutput { get }
}

extension PopularDetailVM where Self: PopularDetailVMInput & PopularDetailVMOutput {
    var input: PopularDetailVMInput { return self }
    var output: PopularDetailVMOutput { return self }
}
