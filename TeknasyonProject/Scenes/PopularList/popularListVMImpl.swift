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

class popularListVMImpl: PopularListVM, PopularListVMInput, PopularListVMOutput {    
    
    
    // MARK: - Inputs
    
    lazy var itemLoadTrigger: AnyObserver<ResultList> = itemAction.inputs
    
    // MARK: - Actions
    
    private lazy var itemAction = Action<ResultList, Void> { [unowned self] item in
        Observable<Void>.create {observer in
            observer.on(.next({
                print("")
                self.router.trigger(.popularDetail(list: item))
                }()))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    // MARK: - Outputs
    
    lazy var items: Observable<[ResultList]> = getList()    
    
    let popularService = PopularService()
    private let disposeBag = DisposeBag()
    
    func getList() -> Observable<[ResultList]> {
        return Observable.create { (observer: AnyObserver<[ResultList]>) -> Disposable in
            
            self.popularService.loadProfile().bind { [unowned self] (response, error) in
                 if let err = error {
                     observer.onError(err)
                     return
                 }
                 if let res = response  {
                    observer.onNext(res.results ?? [ResultList()])
                 }
             
             }
            return Disposables.create()
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
