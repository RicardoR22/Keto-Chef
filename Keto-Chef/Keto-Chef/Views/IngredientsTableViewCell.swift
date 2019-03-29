//
//  IngredientsTableViewCell.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    let label = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
//        label.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        //label.heightAnchor.constraint(equalToConstant: self.frame.height * 0.9).isActive = true
        //label.widthAnchor.constraint(equalToConstant: self.frame.width * 0.95).isActive = true
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
