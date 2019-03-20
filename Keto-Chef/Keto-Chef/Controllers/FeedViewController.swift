//
//  ViewController.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit


class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Trending Recipes"
        collectionView?.backgroundColor = .cyan
        collectionView?.register(RecipeCell.self, forCellWithReuseIdentifier: "cellId")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//        cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
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
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let seperatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            return view
        }()
        
        func setupViews() {
            addSubview(thumbnailImageView)
            addSubview(seperatorView)
            
            
                addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
                addContraintsWithFormat(format: "V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, seperatorView)
                addContraintsWithFormat(format: "H:|[v0]|", views: seperatorView)
        
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


