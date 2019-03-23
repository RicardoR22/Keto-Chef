//
//  RecipeFormView_Constraints.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension RecipeFormView {
    func setViewConstraints() {
        
        // Instruction Label Constraints
        
        InstructionLabel.translatesAutoresizingMaskIntoConstraints = false
        InstructionLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        InstructionLabel.bottomAnchor.constraint(equalTo: formView.topAnchor, constant: -10).isActive = true
        InstructionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        InstructionLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.95).isActive = true
    
    
        // Form View Constraints
        
        formView.translatesAutoresizingMaskIntoConstraints = false
        formView.topAnchor.constraint(equalTo: InstructionLabel.bottomAnchor, constant: 10).isActive = true
        formView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20).isActive = true
        formView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        formView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.95).isActive = true
        
        // Recipe Name Text Field Constraints
        
        recipeNameField.translatesAutoresizingMaskIntoConstraints = false
        recipeNameField.topAnchor.constraint(equalTo: formView.topAnchor, constant: 20).isActive = true
        recipeNameField.centerXAnchor.constraint(equalTo: formView.centerXAnchor).isActive = true
        recipeNameField.widthAnchor.constraint(equalToConstant: self.frame.width * 0.95).isActive = true
        recipeNameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // Recipe Description Text View Constraints
        
        recipeInfoField.translatesAutoresizingMaskIntoConstraints = false
        recipeInfoField.topAnchor.constraint(equalTo: recipeNameField.bottomAnchor, constant: 10).isActive = true
        recipeInfoField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        recipeInfoField.widthAnchor.constraint(equalToConstant: self.frame.width * 0.95).isActive = true
        recipeInfoField.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Create Button Constraints
//        
//        createButton.translatesAutoresizingMaskIntoConstraints = false
//        createButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
//        createButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        createButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.08).isActive = true
//        createButton.widthAnchor.constraint(equalToConstant: self.frame.width * 0.75).isActive = true
        
        // Next Button Constraints
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        nextButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: self.frame.width * 0.3).isActive = true
        
        // Back Button Constraints
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.frame.width * 0.3).isActive = true
        
        
        // Ingredients List Table View Constraints
        
        ingredientsListTable.translatesAutoresizingMaskIntoConstraints = false
        ingredientsListTable.topAnchor.constraint(equalTo: self.formView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        ingredientsListTable.centerXAnchor.constraint(equalTo: self.formView.centerXAnchor).isActive = true
        ingredientsListTable.bottomAnchor.constraint(equalTo: self.formView.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        ingredientsListTable.widthAnchor.constraint(equalToConstant: self.frame.width * 0.95).isActive = true
        
        // Directions List Table View Constraints
        
        directionsListTable.translatesAutoresizingMaskIntoConstraints = false
        directionsListTable.topAnchor.constraint(equalTo: self.formView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        directionsListTable.centerXAnchor.constraint(equalTo: self.formView.centerXAnchor).isActive = true
        directionsListTable.bottomAnchor.constraint(equalTo: self.formView.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        directionsListTable.widthAnchor.constraint(equalToConstant: self.frame.width * 0.95).isActive = true
        
        
        // Ingredients List Header Constraints
        
        ingredientListheaderLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientListheaderLabel.heightAnchor.constraint(equalToConstant: ingredientListheader.frame.height * 0.9).isActive = true
        ingredientListheaderLabel.centerYAnchor.constraint(equalTo: ingredientListheader.centerYAnchor).isActive = true
        ingredientListheaderLabel.leadingAnchor.constraint(equalTo: ingredientListheader.leadingAnchor, constant: 20).isActive = true
        
        addItemBtn.translatesAutoresizingMaskIntoConstraints = false
        addItemBtn.heightAnchor.constraint(equalToConstant: ingredientListheader.frame.height * 0.9).isActive = true
        addItemBtn.centerYAnchor.constraint(equalTo: ingredientListheader.centerYAnchor).isActive = true
        addItemBtn.trailingAnchor.constraint(equalTo: ingredientListheader.trailingAnchor, constant: -5).isActive = true
        
        // Directions List Header Constraints
        
        directionsListheaderLabel.translatesAutoresizingMaskIntoConstraints = false
        directionsListheaderLabel.heightAnchor.constraint(equalToConstant: directionsListheader.frame.height * 0.9).isActive = true
        directionsListheaderLabel.centerYAnchor.constraint(equalTo: directionsListheader.centerYAnchor).isActive = true
        directionsListheaderLabel.leadingAnchor.constraint(equalTo: directionsListheader.leadingAnchor, constant: 20).isActive = true
        
        addDirectionBtn.translatesAutoresizingMaskIntoConstraints = false
        addDirectionBtn.heightAnchor.constraint(equalToConstant: directionsListheader.frame.height * 0.9).isActive = true
        addDirectionBtn.centerYAnchor.constraint(equalTo: directionsListheader.centerYAnchor).isActive = true
        addDirectionBtn.trailingAnchor.constraint(equalTo: directionsListheader.trailingAnchor, constant: -5).isActive = true
    }
}
