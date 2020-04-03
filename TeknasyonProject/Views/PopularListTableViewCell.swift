//
//  PopularListTableViewCell.swift
//
//  Created by Nuevo Appledort on 2.04.2020.
//  Copyright © 2020 Habib Ghafarzadeh. All rights reserved.
//

import UIKit

class PopularListTableViewCell: UITableViewCell {
    
    var TitlePop: UILabel = UILabel()
    var RatePop:  UILabel = UILabel()
    var stackV: UIStackView = UIStackView()
    var img: UIImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        TitlePop.translatesAutoresizingMaskIntoConstraints = false
        RatePop.translatesAutoresizingMaskIntoConstraints = false
        stackV.translatesAutoresizingMaskIntoConstraints = false
        img.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(img)
        contentView.addSubview(stackV)
        stackV.axis = .vertical
        stackV.spacing = 7
        stackV.distribution = .fillEqually
        stackV.addArrangedSubview(TitlePop)
        stackV.addArrangedSubview(RatePop)
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 6
        img.contentMode = .scaleAspectFill
        
        let viewDect = ["stackV": stackV,"img":img]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[img(90)]-[stackV]|", options: [], metrics: nil, views: viewDect))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[img(90)]-|", options: [], metrics: nil, views: viewDect))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[stackV]-|", options: [], metrics: nil, views: viewDect))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
