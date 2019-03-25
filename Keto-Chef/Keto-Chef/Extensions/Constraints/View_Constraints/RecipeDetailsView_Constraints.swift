//
//  RecipeDetailsView_Constraints.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/24/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension RecipeDetailsView {
    
    func setViewConstraints() {
        

        
        // Description Label Constraints
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        
        // Ingredients List Constraints
        ingredientsListTable.translatesAutoresizingMaskIntoConstraints = false
        ingredientsListTable.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        ingredientsListTable.heightAnchor.constraint(equalToConstant: frame.height * 0.3).isActive = true
        
        ingredientsListTable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        ingredientsListTable.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        
        // Ingredients List Header Constraints
        
        ingredientListheaderLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientListheaderLabel.heightAnchor.constraint(equalToConstant: ingredientListheader.frame.height * 0.9).isActive = true
        ingredientListheaderLabel.centerYAnchor.constraint(equalTo: ingredientListheader.centerYAnchor).isActive = true
        ingredientListheaderLabel.leadingAnchor.constraint(equalTo: ingredientListheader.leadingAnchor, constant: 20).isActive = true
        
        // Directions List Constraints
        directionsListTable.translatesAutoresizingMaskIntoConstraints = false
        directionsListTable.topAnchor.constraint(equalTo: ingredientsListTable.bottomAnchor, constant: 44).isActive = true
        directionsListTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        directionsListTable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        directionsListTable.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        
        // Directions List Header Constraints
        
        directionsListheaderLabel.translatesAutoresizingMaskIntoConstraints = false
        directionsListheaderLabel.heightAnchor.constraint(equalToConstant: directionsListheader.frame.height * 0.9).isActive = true
        directionsListheaderLabel.centerYAnchor.constraint(equalTo: directionsListheader.centerYAnchor).isActive = true
        directionsListheaderLabel.leadingAnchor.constraint(equalTo: directionsListheader.leadingAnchor, constant: 20).isActive = true
        
    }
    
    
}
