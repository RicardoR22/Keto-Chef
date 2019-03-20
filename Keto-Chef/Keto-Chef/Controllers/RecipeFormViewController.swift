//
//  RecipeFormViewController.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class RecipeFormViewController: UIViewController {

    var recipeFormView: RecipeFormView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupView()
        setupNav()
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationItem.title = "Sign Up"
    }
    
    func setupView() {
        let mainView = RecipeFormView(frame: self.view.frame)
        self.recipeFormView = mainView
        self.view.addSubview(recipeFormView)
        //setSignupViewConstraints()
        addButtonTarget()
    }
    
    
    // MARK: Button functionality
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipeFormView.firstNameField.resignFirstResponder()

    }
    
    func addButtonTarget() {
//        recipeFormView.registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
    }
    


}
