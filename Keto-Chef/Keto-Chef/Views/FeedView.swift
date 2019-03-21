//
//  ViewController.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit


class FeedView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Trending Recipes"
        collectionView?.backgroundColor = .cyan
        collectionView?.register(RecipeCell.self, forCellWithReuseIdentifier: "cellId")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        //        cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    class RecipeCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        let thumbnailImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .blue
            return imageView
        }()
        
        let profileImage: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .red
            return imageView
        }()
        
        let seperatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            return view
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .red
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        func setupViews() {
            addSubview(thumbnailImageView)
            addSubview(seperatorView)
            addSubview(profileImage)
            addSubview(titleLabel)
            addSubview(descriptionLabel)
            
            //height contraints
            addContraintsWithFormat(format: "H:|-30-[v0]-230-|", views: thumbnailImageView)
            //            addContraintsWithFormat(format: "H:|-30-[v0(44)]", views: profileImage)
            //vertical contraints
            addContraintsWithFormat(format: "V:|-25-[v0(150)]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, profileImage, seperatorView)
            addContraintsWithFormat(format: "H:|[v0]|", views: seperatorView)
            addContraintsWithFormat(format: "H:|-200-[v0]-20-|", views: titleLabel)
            addContraintsWithFormat(format: "V:|-25-[v0(25)]-8-|", views: titleLabel)
            addContraintsWithFormat(format: "H:|-200-[v0]-20-|", views: descriptionLabel)
            addContraintsWithFormat(format: "V:|-60-[v0(120)]-8-|", views: descriptionLabel)
            
            ////            top contraints
            //            addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .top, multiplier: 1, constant: 8)])
            ////
            //            //left contraints
            //            addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 8)])
            //
            ////            //right contraints
            //            addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 8)])
            //            addContraintsWithFormat(format: "V:[v0(20)]", views: titleLabel)
            //            addContraintsWithFormat(format: "H:|[v0]|", views: titleLabel)
            //            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": seperatorView]))
            
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
extension UIView {
    func addContraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}


