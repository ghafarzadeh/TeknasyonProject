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
    private let paging = Paging(limit: 20)
    // MARK: - Views
    
    @IBOutlet private var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private let cellIdentifier = String(describing: PopularListTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewCell()
        configureNavBar()
        initData()
    }
      
        // MARK: - BindableType
    
        func bindViewModel() {
            
            viewModel.output.listItems
                .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier, cellType: PopularListTableViewCell.self)) { row, element, cell in
                    let Name: NSMutableAttributedString = NSMutableAttributedString(string: element.name, attributes: PopularDetailVC.titleParameters)
                    cell.TitlePop.attributedText = Name
                    
                    let vote: NSMutableAttributedString = NSMutableAttributedString(string: "Vote Average: ", attributes: PopularDetailVC.titleParameters)
                    vote.append(NSAttributedString(string: String(describing: element.voteAverage), attributes: PopularDetailVC.titleParameters))
                    cell.RatePop.attributedText = vote
                    cell.selectionStyle = .none
                    cell.img.sd_setImage(with: URL(string: EndPoints.baseUrlPic(size: 200).path + (element.backdrop_path ?? "")))
                }
                .disposed(by: disposeBag)
            
            tableView.rx.modelSelected(ResultList.self).subscribe(onNext: {[weak self] item in
                self?.viewModel.input.itemLoadTrigger.onNext(item)
            }).disposed(by: disposeBag)
            
            tableView.rx.willDisplayCell.subscribe(onNext: { cell, indexPath in
                let threshold = self.paging.threshold + indexPath.row
                
                if threshold == self.viewModel.output.popularList.count && !self.viewModel.output.isLoading {
                    self.paging.offset += 1
                    self.viewModel.output.getList(page: self.paging.offset)
                }
                
            }).disposed(by: disposeBag)
        
        }
    
        // MARK: - Helpers
    
    private func initData() {
        self.viewModel.output.getList(page: self.paging.offset)
    }
        
        private func configureTableViewCell() {
            tableView.register(PopularListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        }
        
        private func configureNavBar() {
            title = "Popular List"
        }
}
