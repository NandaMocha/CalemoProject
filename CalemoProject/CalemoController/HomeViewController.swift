//
//  HomeViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 15/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var wsImageView: UIImageView!
    @IBOutlet weak var wsView: UIView!
    @IBOutlet weak var qotdView: UIView!
    @IBOutlet weak var bgQOTDView: UIImageView!
    
    let dataArray = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    //Variable Declaration
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        setWeeklySummary()
        setQuotes()

    }
    
    func setWeeklySummary(){
        wsImageView.image = UIImage(named: "smile")
    }
    
    func setQuotes(){
        bgQOTDView.image = UIImage(named: "BGQuotes_sample")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let indexToScrollTo = IndexPath(item: dataArray.count-1, section: 0)
        self.collectionView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        cell.dateJournal.text = "June 15, 2019"
        cell.dayJournal.text = dataArray[indexPath.row]
        cell.feelsJournal.image = UIImage(named: "user")
        cell.layer.cornerRadius = 20
        cell.backgroundColor = #colorLiteral(red: 0.7337953448, green: 0.8345138431, blue: 0.7939261794, alpha: 1)
//        cell.viewShadow()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    
    
}
