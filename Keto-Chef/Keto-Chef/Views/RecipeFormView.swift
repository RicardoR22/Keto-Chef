//
//  RecipeFormView.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class RecipeFormView: UIView {

    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        stackView = setupStackView()
        addSubview(stackView)
        setStackViewConstraints()
    }
    
    // MARK: UI
    
    let firstNameField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(red: 0/255, green: 139/255, blue: 139/255, alpha: 0.3)
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        
        let placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "First Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        textField.attributedPlaceholder = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.heightAnchor.constraint(equalToConstant: 40)
        return textField
    }()
    
    let lastNameField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(red: 0/255, green: 139/255, blue: 139/255, alpha: 0.3)
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        
        let placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        textField.attributedPlaceholder = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.heightAnchor.constraint(equalToConstant: 40)
        return textField
    }()
    

    let emailField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(red: 0/255, green: 139/255, blue: 139/255, alpha: 0.3)
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        
        let placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        textField.attributedPlaceholder = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.heightAnchor.constraint(equalToConstant: 40)
        return textField
    }()
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(red: 0/255, green: 139/255, blue: 139/255, alpha: 0.3)
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        
        let placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        textField.attributedPlaceholder = placeholder
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.heightAnchor.constraint(equalToConstant: 40)
        return textField
    }()
    
    
    let registerButton: UIButton = {
        let button = UIButton()
        let buttonColor = UIColor(white: 1, alpha: 0.7)
        let buttonText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Register", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        button.backgroundColor = UIColor(red: 0/255, green: 139/255, blue: 139/255, alpha: 1)
        button.setAttributedTitle(buttonText, for: .normal)
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 40)
        return button
    }()
    
    func setupStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [firstNameField, lastNameField, emailField, passwordField, registerButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
