//
//  ViewController.swift
//  MC1
//
//  Created by Maurizio Minieri on 15/11/2019.
//  Copyright © 2019 Maurizio Minieri. All rights reserved.
//

import UIKit




class DishController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UITabBarDelegate {
   
    var allAntipasti: [Food]!
    var allPrimi: [Food]!
    var allSecondi: [Food]!
    var allDolci: [Food]!
    
    var array: [Food]!
    var ingredients: [String]!
    var imageName: String!
    var origin: String!
    var dishName: String!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segmentedControl.selectedSegmentIndex = 0
        
        let sc: SearchController = SearchController()
        allDolci = sc.allFood.filter { $0.category == Food.Category.dolce}
        allAntipasti = sc.allFood.filter { $0.category == Food.Category.antipasto}
        allPrimi = sc.allFood.filter { $0.category == Food.Category.primo}
        allSecondi = sc.allFood.filter { $0.category == Food.Category.secondo}
        array=allAntipasti
        
       
        view.backgroundColor = .white
    }
    
    
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
         //#warning Incomplete method implementation -- Return the number of sections
         return 1
     }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         //#warning Incomplete method implementation -- Return the number of items in the section
        
       switch segmentedControl.selectedSegmentIndex
        {
            case 0:
                return allAntipasti.count
            case 1:
                return allPrimi.count
            case 2:
                return allSecondi.count
            case 3:
                return allDolci.count
            default:
                break
        }
        
        return 0 //mai eseguito
 
     }
    
    
    //creazione delle celle
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        //cell.backgroundColor = UIColor.blue
        
        
        switch segmentedControl.selectedSegmentIndex
        {
            case 0:
                array=allAntipasti
            case 1:
                array=allPrimi
            case 2:
                array=allSecondi
            case 3:
                array=allDolci
            default:
              break
        }
        
        cell.label?.text = array[indexPath.row].name
        cell.imageView.image = UIImage(named: array[indexPath.row].imageName )
        cell.imageView.isUserInteractionEnabled = true
        cell.imageView.tag = indexPath.row
        
        return cell
    }
    
    
    //prendo le informazioni della cella per passarli alla view di info
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        imageName = array[indexPath.row].imageName
        ingredients = array[indexPath.row].ingredients
        origin = array[indexPath.row].origin
        dishName = array[indexPath.row].name


        self.performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "mySegue"{
            if let vc = segue.destination as? InfoController {

                vc.ingredients = ingredients
                vc.imageName = imageName
                vc.origin = origin
                vc.dishName = dishName
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

    @IBAction func indexChanged(_ sender: Any) {
        collectionView.reloadData()
    }
    
}

