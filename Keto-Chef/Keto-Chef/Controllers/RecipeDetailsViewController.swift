//
//  RecipeDetailsViewController.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/24/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    let network = NetworkingService()
    var recipeDetailView: RecipeDetailsView!
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupNav()
        setupView()
        recipeDetailView.ingredientsListTable.delegate = self
        recipeDetailView.ingredientsListTable.dataSource = self
        recipeDetailView.directionsListTable.delegate = self
        recipeDetailView.directionsListTable.dataSource = self
        
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationItem.title = recipe.recipeName
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupView() {
        let mainView = RecipeDetailsView(frame: self.view.frame)
        self.recipeDetailView = mainView
        self.view.addSubview(recipeDetailView)
        recipeDetailView.descriptionLabel.text = self.recipe.recipeDescription
        setRecipeDetailsViewConstraints()
        self.recipeDetailView.ingredientsListTable.tableFooterView = UIView()
        self.recipeDetailView.directionsListTable.tableFooterView = UIView()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.recipeDetailView.ingredientsListTable {
            return self.recipe.recipeIngredients.count
        } else {
            return self.recipe.recipeDirections.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.recipeDetailView.ingredientsListTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient cell", for: indexPath) as! IngredientsTableViewCell
            
            cell.label.text = self.recipe.recipeIngredients[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient cell", for: indexPath) as! IngredientsTableViewCell
            
            cell.label.text = self.recipe.recipeDirections[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
}



