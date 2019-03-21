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
        label.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        //label.heightAnchor.constraint(equalToConstant: self.frame.height * 0.9).isActive = true
        label.widthAnchor.constraint(equalToConstant: self.frame.width * 0.7).isActive = true
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
