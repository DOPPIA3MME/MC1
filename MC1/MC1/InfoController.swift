//
//  InfoController.swift
//  MC1
//
//  Created by Maurizio Minieri on 16/11/2019.
//  Copyright © 2019 Maurizio Minieri. All rights reserved.
//

import UIKit

class InfoController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UITabBarDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    
    var ingredients: [String]!
    var imageName: String!
    var origin: String!
    var dishName: String!
    var dishDescription: String!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)
       // ingredientsTextView.text = ingredients.joined(separator: "\n\n")
        originLabel.text = origin
        navigationItem.title = dishName
        descriptionTextView.text = dishDescription
        
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
           return 1
       }

       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return ingredients.count
       }
    
    
    //creazione delle celle
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
         
       
           //cell.backgroundColor = UIColor.green
           cell.label?.text = ingredients[indexPath.row]
           cell.imageView.image = UIImage(named: ingredients[indexPath.row] )
           //cell.imageView.isUserInteractionEnabled = true
           //cell.imageView.tag = indexPath.row

           return cell
       }
    
    
    //attributi della cella
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {

           let leftAndRightPaddings: CGFloat = 0.0
           let numberOfItemsPerRow: CGFloat = CGFloat(1)
           let bounds = UIScreen.main.bounds
           let width = (bounds.size.width - leftAndRightPaddings) / numberOfItemsPerRow
           let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
           layout.itemSize = CGSize(width: width, height: 25)

           return layout.itemSize
           
       }
       
    

}
