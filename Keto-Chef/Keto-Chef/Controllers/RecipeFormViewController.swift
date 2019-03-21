//
//  RecipeFormViewController.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class RecipeFormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    var recipeFormView: RecipeFormView!

    var currentStep = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupView()
        setupNav()
        recipeFormView.ingredientsListTable.delegate = self
        recipeFormView.ingredientsListTable.dataSource = self
        recipeFormView.directionsListTable.delegate = self
        recipeFormView.directionsListTable.dataSource = self
        recipeFormView.recipeInfoField.delegate = self
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationItem.title = "Create Recipe"
    }
    
    func setupView() {
        let mainView = RecipeFormView(frame: self.view.frame)
        self.recipeFormView = mainView
        self.view.addSubview(recipeFormView)
        setRecipeFormViewConstraints()
        addButtonTarget()
    }
    
    
    // MARK: Button functionality
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipeFormView.recipeNameField.resignFirstResponder()
        recipeFormView.recipeInfoField.resignFirstResponder()

    }
    
    func stepHandler() {
        if currentStep == 1 {
            self.recipeFormView.recipeNameField.isHidden = false
            self.recipeFormView.recipeInfoField.isHidden = false
            self.recipeFormView.ingredientsListTable.isHidden = true
            self.recipeFormView.directionsListTable.isHidden = true
            self.recipeFormView.backButton.isHidden = true
            let nextBtnTitle = NSMutableAttributedString(attributedString: NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
            self.recipeFormView.nextButton.setAttributedTitle(nextBtnTitle, for: .normal)
            self.recipeFormView.InstructionLabel.text = "Give your recipe a name and short description"
        } else if currentStep == 2 {
            self.recipeFormView.recipeNameField.isHidden = true
            self.recipeFormView.recipeInfoField.isHidden = true
            self.recipeFormView.ingredientsListTable.isHidden = false
            self.recipeFormView.directionsListTable.isHidden = true
            self.recipeFormView.backButton.isHidden = false
            let nextBtnTitle = NSMutableAttributedString(attributedString: NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
            self.recipeFormView.nextButton.setAttributedTitle(nextBtnTitle, for: .normal)
            self.recipeFormView.InstructionLabel.text = "Now let's add the ingredients"
        } else if currentStep == 3 {
            self.recipeFormView.ingredientsListTable.isHidden = true
            self.recipeFormView.directionsListTable.isHidden = false
            let nextBtnTitle = NSMutableAttributedString(attributedString: NSAttributedString(string: "Create!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
            self.recipeFormView.nextButton.setAttributedTitle(nextBtnTitle, for: .normal)
            self.recipeFormView.InstructionLabel.text = "Now let's add some step by step instructions"
        }
    }
    
    @objc func nextBtnTapped() {
        if currentStep < 3 {
            currentStep += 1
            stepHandler()
        }
    }
    
    @objc func backBtnTapped() {
        if currentStep > 1 {
            currentStep -= 1
            stepHandler()
        }
    }
    
    func addButtonTarget() {
        recipeFormView.nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        recipeFormView.backButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        recipeFormView.addItemBtn.addTarget(self, action: #selector(addIngredientTapped), for: .touchUpInside)
        recipeFormView.addDirectionBtn.addTarget(self, action: #selector(addDirectionTapped), for: .touchUpInside)
    
    }
    
    @objc func addIngredientTapped() {
        
        print("Add Ingredient Tapped")
        
        let alert = UIAlertController(title: "Add Ingredient", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input Ingredient Name and amount, e.g. 1 cup milk"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let itemName = alert.textFields?.first?.text {
                print("WORKING")

                self.recipeFormView.ingredientsList.append(itemName)
                self.recipeFormView.ingredientsListTable.reloadData()
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    @objc func addDirectionTapped() {
        
        print("Add Direction Tapped")
        
        let alert = UIAlertController(title: "Add Direction", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input Direction, e.g. Mix in 1 cup of milk"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let itemName = alert.textFields?.first?.text {
                print("WORKING")
                
                self.recipeFormView.directionsList.append(itemName)
                print("item added")
                self.recipeFormView.directionsListTable.reloadData()
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.recipeFormView.ingredientsListTable {
            return self.recipeFormView.ingredientsList.count
        } else {
            return self.recipeFormView.directionsList.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.recipeFormView.ingredientsListTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient cell", for: indexPath) as! IngredientsTableViewCell
            
            cell.label.text = self.recipeFormView.ingredientsList[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient cell", for: indexPath) as! IngredientsTableViewCell
            
            cell.label.text = self.recipeFormView.directionsList[indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipeFormView.ingredientsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //MARK:- UITextViewDelegates
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Recipe Description" {
            textView.text = ""
            textView.textColor = UIColor.black
            textView.font = UIFont.systemFont(ofSize: 20)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Recipe Description", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
        }
    }
    


}
