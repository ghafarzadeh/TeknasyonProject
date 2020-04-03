//
//  popularListVMImpl.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 2.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
import Action
import RxSwift
import XCoordinator
import RxCocoa

class PopularListVMImpl: PopularListVM, PopularListVMInput, PopularListVMOutput {
    
    var listItems: BehaviorRelay<[ResultList]> = BehaviorRelay(value: [])
    
    var isLoading: Bool = false
    var popularList: [ResultList] = []
        
    let popularService = PopularService()
    private let disposeBag = DisposeBag()
    
    // MARK: - Inputs
    
    lazy var itemLoadTrigger: AnyObserver<ResultList> = itemAction.inputs
    
    // MARK: - Actions
    
    private lazy var itemAction = Action<ResultList, Void> { [unowned self] item in
        Observable<Void>.create {observer in
            observer.on(.next({
                self.router.trigger(.popularDetail(list: item))
                }()))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    // MARK: - Outputs

    func getList(page: Int) {
        self.popularService.loadProfile(page: page).bind { [unowned self] (response, error) in
            if error != nil {
                return
            }
            if let res = response {
               if page == 1 {
                   self.popularList = res.results!
               } else {
                   self.popularList.append(contentsOf: res.results!)
               }
               self.isLoading = false
               self.listItems.accept(self.popularList)
            }
        }
    }
    
    // MARK: - Private
    
  //  private var selectableType: PopularList//selectedModel
    let router: AnyRouter<AppRoute>
    
    // MARK: - Init
    
    init(_ route: AnyRouter<AppRoute>) {
       // self.selectableType = selectableType
        self.router = route
    }
}
