//
//  Recipe.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/20/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation

struct Recipe {
    var recipeName: String
    var recipeDescription: String
    var recipeIngredients: [String]
    var recipeDirections: [String]
    
    init(name: String, description: String, ingredients: [String], directions: [String]) {
        self.recipeName = name
        self.recipeDescription = description
        self.recipeIngredients = ingredients
        self.recipeDirections = directions
    }
}
