//
//  RecipeFormViewController.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

class RecipeFormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, UITextFieldDelegate {

    let network = NetworkingService()
    var recipeFormView: RecipeFormView!

    var currentStep = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: View setup
    
    func setup() {
        setupNav()
        setupView() 
        recipeFormView.ingredientsListTable.delegate = self
        recipeFormView.ingredientsListTable.dataSource = self
        recipeFormView.directionsListTable.delegate = self
        recipeFormView.directionsListTable.dataSource = self
        recipeFormView.recipeInfoField.delegate = self
        recipeFormView.recipeNameField.delegate = self
    }
    
    func setupNav() {
        navigationController?.navigationBar.tintColor = UIColor(white: 1, alpha: 0.7)
        navigationItem.title = "Create Recipe"
        
        let cancelRecipe = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelRecipeTapped))
        cancelRecipe.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.leftBarButtonItem = cancelRecipe
    }
    
    @objc func cancelRecipeTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupView() {
        let mainView = RecipeFormView(frame: self.view.frame)
        self.recipeFormView = mainView
        self.view.addSubview(recipeFormView)
        setRecipeFormViewConstraints()
        addButtonTarget()
        self.recipeFormView.ingredientsListTable.tableFooterView = UIView()
        self.recipeFormView.directionsListTable.tableFooterView = UIView()
    }
    
    
    // MARK: Button functionality
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        recipeFormView.recipeNameField.resignFirstResponder()
        recipeFormView.recipeInfoField.resignFirstResponder()

    }
    
    func stepHandler() {
        
        /* Get the subviews of the formView and checks to see
         if the subviews tag is equal to the current step of the creation process.
         if it is, make it visible, if not hide it from the user.
        */
        
        for subview in self.recipeFormView.formView.subviews {
            if subview.tag == currentStep {
                subview.isHidden = false
            } else {
                subview.isHidden = true
            }
        }
        
        /* Checks the current step and changes the Instruction label text to the appropriate instruction
         also changes whether the back button is visible or if the next button should be changed to Create
        */
        
        if currentStep == 1 {
            self.recipeFormView.backButton.isHidden = true
            self.recipeFormView.InstructionLabel.text = "Give your recipe a name and short description"
        } else if currentStep == 2 {
            self.recipeFormView.backButton.isHidden = false
            let nextBtnTitle = NSMutableAttributedString(attributedString: NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
            self.recipeFormView.nextButton.setAttributedTitle(nextBtnTitle, for: .normal)
            self.recipeFormView.InstructionLabel.text = "Now let's add the ingredients"
        } else if currentStep == 3 {
            let nextBtnTitle = NSMutableAttributedString(attributedString: NSAttributedString(string: "Create", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
            self.recipeFormView.nextButton.setAttributedTitle(nextBtnTitle, for: .normal)
            self.recipeFormView.InstructionLabel.text = "Now let's add some step by step instructions"
        }
    }
    
   
    
    func checkForValidInput() -> Bool {
        if currentStep == 1 {
            if recipeFormView.recipeNameField.text == nil || recipeFormView.recipeNameField.text == "Recipe Name"{
                missingContentWarning(missingContent: "Recipe Name")
                return false
            } else if recipeFormView.recipeInfoField.text == nil || recipeFormView.recipeInfoField.text == "Recipe Description"{
                missingContentWarning(missingContent: "Recipe Description")
                return false
            }
            return true
        } else if currentStep == 2 {
            if recipeFormView.ingredientsList.count == 0 {
                missingContentWarning(missingContent: "Ingredients")
                return false
            }
            return true
        } else if currentStep == 3 {
            if recipeFormView.directionsList.count == 0 {
                missingContentWarning(missingContent: "Directions")
                return false
            }
            return true
        }
        return true
    }
    
    @objc func nextBtnTapped() {
        if currentStep < 3 {
            if checkForValidInput() {
                currentStep += 1
                stepHandler()
            }
        } else if currentStep == 3 {
            if checkForValidInput() {
                createRecipe()
            }
        }
    }
    
    @objc func backBtnTapped() {
        if currentStep > 1 {
            currentStep -= 1
            stepHandler()
        }
    }
    
    @objc func selectImageBtnTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType =  UIImagePickerController.SourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func addButtonTarget() {
        recipeFormView.nextButton.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        recipeFormView.backButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        recipeFormView.addItemBtn.addTarget(self, action: #selector(addIngredientTapped), for: .touchUpInside)
        recipeFormView.addDirectionBtn.addTarget(self, action: #selector(addDirectionTapped), for: .touchUpInside)
        recipeFormView.selectImageButton.addTarget(self, action: #selector(selectImageBtnTapped), for: .touchUpInside)
    
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
                if itemName.isEmpty == false {
                    self.recipeFormView.ingredientsList.append(itemName)
                    self.recipeFormView.ingredientsListTable.reloadData()
                }
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
                if itemName.isEmpty == false {
                    self.recipeFormView.directionsList.append(itemName)
                    self.recipeFormView.directionsListTable.reloadData()
                }
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    func missingContentWarning(missingContent: String) {

        let alert = UIAlertController(title: "You are missing: \(missingContent)", message: "Please make sure all fields are filled out", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        
        self.present(alert, animated: true)
    }
    
    func createRecipe(){
        let recipeName = self.recipeFormView.recipeNameField.text!
        let recipeDescription = self.recipeFormView.recipeInfoField.text!
        let recipeIngredients = self.recipeFormView.ingredientsList
        let recipeDirections = self.recipeFormView.directionsList
        
        let recipe = Recipe(name: recipeName, description: recipeDescription, ingredients: recipeIngredients, directions: recipeDirections)
        
        network.saveRecipe(recipe: recipe)
        
        navigationController?.popToRootViewController(animated: true)
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
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Recipe Name" {
            textField.text = ""
            textField.textColor = UIColor.black
            textField.font = UIFont.systemFont(ofSize: 20)
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.resignFirstResponder()
        }
        return true
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Recipe Name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor(white: 1, alpha: 0.9)]))
        }
    }
    


}
