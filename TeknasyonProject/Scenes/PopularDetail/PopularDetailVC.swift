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
    
    static let titleParameters = [NSAttributedString.Key.foregroundColor: UIColor.labelColor,
                           NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
    static let subtitleParameters = [NSAttributedString.Key.foregroundColor: UIColor.labelColor,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        let data = viewModel.input.list
        img.sd_setImage(with: URL(string: EndPoints.baseUrlPic(size: 400).path + (data.poster_path ?? "")))

        let OrjName: NSMutableAttributedString = NSMutableAttributedString(string: "Orjinal Name: ", attributes: PopularDetailVC.titleParameters)
        OrjName.append(NSAttributedString(string: data.originalName, attributes: PopularDetailVC.subtitleParameters))
        name.attributedText = OrjName
        
        let Lang: NSMutableAttributedString = NSMutableAttributedString(string: "Language: ", attributes: PopularDetailVC.titleParameters)
        Lang.append(NSAttributedString(string: data.original_language ?? "", attributes: PopularDetailVC.subtitleParameters))
        language.attributedText = Lang
        
        let Descrip: NSMutableAttributedString = NSMutableAttributedString(string: "overview: ", attributes: PopularDetailVC.titleParameters)
        Descrip.append(NSAttributedString(string: data.overview ?? "", attributes: PopularDetailVC.subtitleParameters))
        des.attributedText = Descrip
    }
}
