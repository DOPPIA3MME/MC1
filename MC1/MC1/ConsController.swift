//
//  MainController.swift
//  MC1
//
//  Created by Maurizio Minieri on 19/11/2019.
//  Copyright © 2019 Maurizio Minieri. All rights reserved.
//

import UIKit

class ConsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UITabBarDelegate {
    
    
    @IBOutlet weak var consNavigationItem: UINavigationItem!
    var cFood = [
        Food(name: "Arancini", category: .antipasto, origin: "Sicilia", ingredients: ["rice","meat","cheese"], imageName: "arancini1", description: "descrizione bella e precisa descrizione bella e precisa descrizione bella e precisa descrizione bella e precisa descrizione bella e precisa"),
        Food(name: "Crocchè", category: .antipasto, origin: "Sicilia", ingredients: ["patate","basilico","mozzarella","..."], imageName: "croccImg", description: ""),
        Food(name: "Carbonara", category: .primo, origin: "Lazio", ingredients: ["spaghetti","egg yolks","salt","jowl","pecorino romano","piper nigrium"], imageName: "carbonaraImg", description: ""),
        Food(name: "Risotto alla zucca", category: .primo, origin: "Lombardia", ingredients: ["rice","onion","parmiggiano reggiano","butter","salt","gourd", "vegetable broth", "white wine", "piper nigrium", "Extra virgin olive oil"], imageName: "risottozuccaImg", description: ""),
        Food(name: "Panna Cotta", category: .dolce, origin: "Piemonte", ingredients: ["liquid cream","jelly sheets","vanilla pod", "sugar"], imageName: "pannacottaImg", description: ""),
        Food(name: "Cannolo", category: .dolce, origin: "Sicily", ingredients: ["flour","lard","salt","white wine vinegar","sugar","bitter cocoa","eggs","marsala","milk cheese","chocolate chip"], imageName: "cannoloImg", description: "")
              ].sorted {$0.name < $1.name}
    
    
    var array: [Food]!
    var ingredients: [String]!
    var imageName: String!
    var origin: String!
    var dishName: String!
    var dishDescription: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        consNavigationItem.title = "Recommended"
        array=cFood
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return cFood.count
    }
    
    
    
    //creazione delle celle
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
      
        
        //cell.backgroundColor = UIColor.green
        cell.label?.text = cFood[indexPath.row].name
        cell.imageView.image = UIImage(named: cFood[indexPath.row].imageName )
        cell.imageView.isUserInteractionEnabled = true
        cell.imageView.tag = indexPath.row

        return cell
    }
       
       
    //prendo le informazioni della cella per passarli alla view di info
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        imageName = cFood[indexPath.row].imageName
        ingredients = cFood[indexPath.row].ingredients
        origin = cFood[indexPath.row].origin
        dishName = cFood[indexPath.row].name
        dishDescription = cFood[indexPath.row].description

        self.performSegue(withIdentifier: "mySegue", sender: self)
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
        if segue.identifier == "mySegue"{
            if let vc = segue.destination as? InfoController {
              
               vc.ingredients = ingredients
               vc.imageName = imageName
               vc.origin = origin
               vc.dishName = dishName
               vc.dishDescription = dishDescription
            }
        }
      }
        
       
        
    //attributi della cella
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {

          let leftAndRightPaddings: CGFloat = 40.0
           let numberOfItemsPerRow: CGFloat = CGFloat(1)
           let bounds = UIScreen.main.bounds
           let width = (bounds.size.width - leftAndRightPaddings) / numberOfItemsPerRow
           let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
           layout.itemSize = CGSize(width: width, height: 222)

           return layout.itemSize
           
       }
       
  
}
