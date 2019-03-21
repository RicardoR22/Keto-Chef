//
//  RecipesFormVC_Constraints.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension RecipeFormViewController {
    
    func setRecipeFormViewConstraints() {
        recipeFormView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: recipeFormView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: view.frame.width)
        let heightConstraint = NSLayoutConstraint(item: recipeFormView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: view.frame.height)
        let horizontalConstraint = NSLayoutConstraint(item: recipeFormView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: recipeFormView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.view.addConstraints([widthConstraint, heightConstraint, horizontalConstraint, verticalConstraint])
    }
}
