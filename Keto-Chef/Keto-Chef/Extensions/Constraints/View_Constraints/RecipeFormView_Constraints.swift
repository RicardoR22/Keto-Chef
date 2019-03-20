//
//  RecipeFormView_Constraints.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension RecipeFormView {
    func setStackViewConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: self.frame.height / 2.5).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.75).isActive = true
    }
}
