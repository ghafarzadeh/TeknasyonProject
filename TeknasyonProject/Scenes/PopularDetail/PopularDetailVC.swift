//
//  PopularDetailVC.swift
//  TeknasyonProject
//
//  Created by Nuevo Appledort on 3.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import XCoordinator
import SDWebImage

class PopularDetailVC: UIViewController, BindableType {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var des: UILabel!
    
    var viewModel: PopularDetailVM!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        let data = viewModel.input.list
        img.sd_setImage(with: URL(string: EndPoints.baseUrlPic(size: 400).path + (data.poster_path ?? "")))
        
        name.text = data.originalName
        language.text = data.original_language
        des.text = data.overview
    }

}
