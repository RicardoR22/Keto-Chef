//
//  ViewController.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let network = NetworkingService()
    
    var recipesFromDB: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        network.getRecipes(){ (recipeList) in
            self.recipesFromDB = recipeList
            print("these are the recipes \(self.recipesFromDB)")
            self.collectionView.reloadData()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "All Recipes"
        let addRecipe = UIBarButtonItem(title: "Add Recipe", style: .plain, target: self, action: #selector(addRecipeTapped))
        addRecipe.tintColor = UIColor(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
        navigationItem.rightBarButtonItem = addRecipe
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        collectionView?.register(RecipeCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    @objc func addRecipeTapped() {
        let newRecipeVC = RecipeFormViewController()
        self.navigationController?.pushViewController(newRecipeVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipesFromDB.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RecipeCell
        let recipe = recipesFromDB[indexPath.row]
        cell.configure(recipe: recipe)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    class RecipeCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        func configure(recipe: Recipe) {
            titleLabel.text = recipe.recipeName
            descriptionLabel.text = recipe.recipeDescription
        }
        
        let thumbnailImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.init(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
            return imageView
        }()
        
        
        let seperatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            return view
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = UIColor.init(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .center
            return label
        }()
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            //label.backgroundColor = UIColor.init(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
            //label.textColor = UIColor.init(red: 61/255, green: 204/255, blue: 142/255, alpha: 1)
            label.sizeToFit()
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            
            return label
        }()
        
        func setupViews() {
                
            addSubview(thumbnailImageView)
            addSubview(seperatorView)
            addSubview(titleLabel)
            addSubview(descriptionLabel)
            
            thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
            thumbnailImageView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.8).isActive = true
            thumbnailImageView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.4).isActive = true
            thumbnailImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
            thumbnailImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
            
            seperatorView.translatesAutoresizingMaskIntoConstraints = false
            seperatorView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.01).isActive = true
            seperatorView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
            seperatorView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.2).isActive = true
            titleLabel.leftAnchor.constraint(equalTo: thumbnailImageView.rightAnchor, constant: 5).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -5).isActive = true
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor).isActive = true
            
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.leftAnchor.constraint(equalTo: thumbnailImageView.rightAnchor, constant: 5).isActive = true
            descriptionLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -5).isActive = true
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
            //descriptionLabel.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor).isActive = true
            

        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
