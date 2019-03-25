//
//  RecipeDetailsView.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/24/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class RecipeDetailsView: UIView {
    
    
    var ingredientsListTable = UITableView()
    var directionsListTable = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createHeaderView()
        setupView()
  
    }
    
    
    
    func setupView() {
        backgroundColor = .white
        setupSubViews()
        //createHeaderView()
        ingredientsListTable.register(IngredientsTableViewCell.self, forCellReuseIdentifier: "ingredient cell")
        directionsListTable.register(IngredientsTableViewCell.self, forCellReuseIdentifier: "ingredient cell")
        setViewConstraints()
    }
    
    func setupSubViews() {
        addSubview(descriptionLabel)
        addSubview(ingredientsListTable)
        addSubview(directionsListTable)
        
    }
    

    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        return label
    }()
    
    let ingredientListheader = UIView()
    let ingredientListheaderLabel = UILabel()
    
    let directionsListheader = UIView()
    let directionsListheaderLabel = UILabel()
    
    func createHeaderView() {
        // Header for ingredients list
        ingredientListheader.frame = CGRect(x: 0, y: 0, width: self.ingredientsListTable.frame.width, height: 40)
        ingredientListheader.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        
        ingredientListheaderLabel.text = "Ingredients"
        ingredientListheaderLabel.textColor = UIColor(white: 1, alpha: 0.9)
        
        
        ingredientListheader.addSubview(ingredientListheaderLabel)
        
        // Header for directions list
        directionsListheader.frame = CGRect(x: 0, y: 0, width: self.ingredientsListTable.frame.width, height: 40)
        directionsListheader.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        
        directionsListheaderLabel.text = "Directions"
        directionsListheaderLabel.textColor = UIColor(white: 1, alpha: 0.9)
        
        
        directionsListheader.addSubview(directionsListheaderLabel)
        
        
        addSubview(ingredientListheader)
        ingredientsListTable.tableHeaderView = ingredientListheader
        addSubview(directionsListheader)
        directionsListTable.tableHeaderView = directionsListheader
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
