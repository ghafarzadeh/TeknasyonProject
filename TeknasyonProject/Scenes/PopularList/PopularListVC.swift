//
//  PopularListVC.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 1.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import Foundation
import RxSwift
import XCoordinator
import UIKit
import SDWebImage

class PopularListVC: UIViewController, BindableType {
   var viewModel: PopularListVM!

    // MARK: - Views
    
    @IBOutlet private var tableView: UITableView!
    
    
    private let disposeBag = DisposeBag()
    private let cellIdentifier = String(describing: PopularListTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewCell()
        configureNavBar()
        
    }
      
        // MARK: - BindableType
    
        func bindViewModel() {
            viewModel.output.items
                .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier, cellType: PopularListTableViewCell.self)) { row, element, cell in
                    cell.TitlePop.text = element.name
                    cell.RatePop.text = String(describing: element.popularity)
                    cell.selectionStyle = .none
                    cell.img.sd_setImage(with: URL(string: EndPoints.baseUrlPic(size: 200).path + (element.backdrop_path ?? "")))
                    
                }
                .disposed(by: disposeBag)
            
            tableView.rx.modelSelected(ResultList.self).subscribe(onNext: {[weak self] item in
                self?.viewModel.input.itemLoadTrigger.onNext(item)
            }).disposed(by: disposeBag)
            
            self.tableView.rx.contentOffset
                .flatMap { (offset) -> Observable<Void> in
                    true ? Observable.just(Void()): Observable.empty()

            }
            
            
        }
    
        // MARK: - Helpers
        
        private func configureTableViewCell() {
            tableView.register(PopularListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        }
        
        private func configureNavBar() {
            title = ""
        }
}
