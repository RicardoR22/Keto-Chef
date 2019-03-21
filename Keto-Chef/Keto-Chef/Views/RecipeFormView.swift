//
//  RecipeFormView.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class RecipeFormView: UIView {

    var formView = UIView()
    var ingredientsListTable = UITableView()
    var directionsListTable = UITableView()
    
    var ingredientsList:[String] = []
    var directionsList:[String] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        setupSubViews()
        createHeaderView()
        //createButton.isHidden = true
        ingredientsListTable.isHidden = true
        directionsListTable.isHidden = true
        backButton.isHidden = true
        ingredientsListTable.register(IngredientsTableViewCell.self, forCellReuseIdentifier: "ingredient cell")
        directionsListTable.register(IngredientsTableViewCell.self, forCellReuseIdentifier: "ingredient cell")
        setViewConstraints()
    }
    
    func setupSubViews() {
        addSubview(InstructionLabel)
        addSubview(formView)
        formView.addSubview(recipeNameField)
        formView.addSubview(recipeInfoField)
        formView.addSubview(ingredientsListTable)
        formView.addSubview(directionsListTable)
        addSubview(backButton)
        addSubview(nextButton)
    }
    
    // MARK: UI
    
    let InstructionLabel: UILabel = {
        let textField = UILabel()
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        
        textField.text = "Give your recipe a name and short description"
        return textField
    }()
    
    let recipeNameField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        
        let placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Recipe Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
        textField.attributedPlaceholder = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.leftPadding(space: 5)
        return textField
    }()
    
    let recipeInfoField: UITextView = {
        let textField = UITextView()
        textField.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        
        let placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Recipe Description", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
        textField.attributedText = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        //textField.clearsOnInsertion = true
        textField.isEditable = true
        textField.textContainerInset = UIEdgeInsets(top: 5,left: 2,bottom: 0,right: 5)
        return textField
    }()
    
//    let createButton: UIButton = {
//        let button = UIButton()
//        let buttonColor = UIColor(white: 1, alpha: 0.7)
//        let buttonText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Create", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
//        button.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
//        button.setAttributedTitle(buttonText, for: .normal)
//        button.layer.cornerRadius = 5
//        button.heightAnchor.constraint(equalToConstant: 40)
//        return button
//    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        let buttonColor = UIColor(white: 1, alpha: 0.7)
        let buttonText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
        button.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        button.setAttributedTitle(buttonText, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        let buttonColor = UIColor(white: 1, alpha: 0.7)
        let buttonText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Back", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.lightGray]))
        //button.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        button.setAttributedTitle(buttonText, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let ingredientListheader = UIView()
    let addItemBtn = UIButton.init(type: .contactAdd)
    let ingredientListheaderLabel = UILabel()
    
    let directionsListheader = UIView()
    let addDirectionBtn = UIButton.init(type: .contactAdd)
    let directionsListheaderLabel = UILabel()
    
    func createHeaderView() {
        // Header for ingredients list
        ingredientListheader.frame = CGRect(x: 0, y: 0, width: self.ingredientsListTable.frame.width, height: 40)
        ingredientListheader.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        
        ingredientListheaderLabel.text = "Ingredients"
        ingredientListheaderLabel.textColor = UIColor(white: 1, alpha: 0.9)
        
        addItemBtn.tintColor = .white
        
        ingredientListheader.addSubview(ingredientListheaderLabel)
        ingredientListheader.addSubview(addItemBtn)
        
        // Header for directions list
        directionsListheader.frame = CGRect(x: 0, y: 0, width: self.ingredientsListTable.frame.width, height: 40)
        directionsListheader.backgroundColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        
        directionsListheaderLabel.text = "Directions"
        directionsListheaderLabel.textColor = UIColor(white: 1, alpha: 0.9)
        
        addDirectionBtn.tintColor = .white
        
        directionsListheader.addSubview(directionsListheaderLabel)
        directionsListheader.addSubview(addDirectionBtn)
        
        
        addSubview(ingredientListheader)
        ingredientsListTable.tableHeaderView = ingredientListheader
        addSubview(directionsListheader)
        directionsListTable.tableHeaderView = directionsListheader
    }
     
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
