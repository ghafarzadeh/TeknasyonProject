//
//  AppCoordinator.swift
//
//  Created by Nuevo Appledort on 31.03.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import UIKit
import XCoordinator

enum AppRoute: Route {
    case popularList
    case popularDetail(list: ResultList)
}

class AppCoordinator: NavigationCoordinator<AppRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .popularList)
    }

    // MARK: Overrides

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .popularList:
            let viewController = PopularListVC.instantiateFromNib()
            let viewModel = PopularListVMImpl(unownedRouter)
            viewController.bind(to: viewModel)
            return .push(viewController)
        case .popularDetail(let list):
            let viewController = PopularDetailVC.instantiateFromNib()
            let viewModel = PopularDetailVMImpl(unownedRouter, list: list)
            viewController.bind(to: viewModel)
            return .push(viewController)
        
        }
    }
}
