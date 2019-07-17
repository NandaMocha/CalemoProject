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
    
    func setCoreData(date: String, feels: String, reason: String, question1: String, answer1: String, question2: String, answer2: String, question3: String, answer3: String, notes: String, image: Data){
        let journal = Journal.init(context: self.context)
        
        journal.dateJournal = date
        journal.feelsJournal = feels
        journal.reasonJournal = reason
        journal.questionOneJournal = question1
        journal.answerOneJournal = answer1
        journal.questionTwoJournal = question2
        journal.answerTwoJournal = answer2
        journal.questionThreeJournal = question3
        journal.answerThreeJournal = answer3
        journal.notesJournal = notes
        journal.imageJournal = image
        
        
    }
    
    func setQuotes(){
        bgQOTDView.image = UIImage(named: "BGQuotes_sample")
    }
    
    func setWeeklySummary(){
        wsImageView.image = UIImage(named: "smile")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("See All Journal Tapped")
            let journalSB = UIStoryboard(name: "Journaling", bundle: nil).instantiateViewController(withIdentifier: "IntroJournalingViewController") as! IntroJournalingViewController
            
            navigationController?.show(journalSB, sender: self)
        case 1:
            print("See All Summary Tapped")
            let allSummary = UIStoryboard(name: "BarStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "BarChartViewController") as! BarChartViewController
            
            navigationController?.show(allSummary, sender: self)
        default:
            print("Not Tapped")
        }
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row < dataArray.count{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
            
            cell.dateJournal.text = "June 15, 2019"
            cell.dayJournal.text = dataArray[indexPath.row]
            cell.feelsJournal.image = UIImage(named: "0\(indexPath.row+1)")
            cell.layer.cornerRadius = 20
            cell.backgroundColor = #colorLiteral(red: 0.7337953448, green: 0.8345138431, blue: 0.7939261794, alpha: 1)
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddNewCell", for: indexPath) as! AddNewCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row < dataArray.count{
            let detailJournal = UIStoryboard(name: "Journal", bundle: nil).instantiateViewController(withIdentifier: "DetailJournalViewController") as! DetailJournalViewController
            
            navigationController?.show(detailJournal, sender: self)
        }else{
            let alert = UIAlertController(title: "Sorry", message: "Go To Create New Journal", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            present(alert, animated: true)
        }
    }
}

//MARK:- Set Life Cycle
extension HomeViewController{
    override func viewWillAppear(_ animated: Bool) {
        let indexToScrollTo = IndexPath(item: dataArray.count-1, section: 0)
        self.collectionView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
}
