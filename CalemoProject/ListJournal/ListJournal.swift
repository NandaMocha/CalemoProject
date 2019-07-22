//
//  ViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 01/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class ListJournal: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    
    var data = DataManager.shared.journalDataLoadDummy
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("You arrived in List Jurnal", data.count)
    }
    
    // MARK: - UICollectionViewDataSource protocol

    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var day = ""
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CalemoCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.listLabel.text = self.items[indexPath.item]
//        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        day = day.getDay(date: data[indexPath.row].dateJournal!)
        let feel = UIImage(named: "0\(indexPath.row+1)")!
        let date = data[indexPath.row].dateJournal!
        let emotion = "0\(indexPath.row+1)"
        
        cell.setContent(day: day, feel: feel, date: date, emotion: emotion)
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    
}

