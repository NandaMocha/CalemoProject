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

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var greetingName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var wsImageView: UIImageView!
    @IBOutlet weak var wsView: UIView!
    @IBOutlet weak var qotdView: UIView!
    @IBOutlet weak var bgQOTDView: UIImageView!


    //Set The Data used
    let dataJournal = DataManager.shared.journalDataLoadDummy

    //Variable Declaration
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dateToday = String()
    var totalCard = 0

    var flag = false

    override func viewDidLoad() {
        super.viewDidLoad()

        if DataManager.shared.nameUser != ""{
            greetingName.text = "Hello, \n\(DataManager.shared.nameUser)"
        }

        scrollView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        setWeeklySummary()
        setQuotes()

        //Get Current Date
        dateToday = dateToday.getDate()

    }

    func setQuotes(){
        bgQOTDView.image = UIImage(named: "BGQuotes_sample")
        authorLabel.text = authorLabel.text?.uppercased()
        authorLabel.addCharacterSpacing(kernValue: 6)
    }

    func setWeeklySummary(){
        wsImageView.image = UIImage(named: "09")
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("See All Journal Tapped")
            let journalSB = UIStoryboard(name: "Journaling", bundle: nil).instantiateViewController(withIdentifier: "ListJournal") as! ListJournal

            self.tabBarController?.tabBar.isHidden = true

            navigationController?.show(journalSB, sender: self)
        case 1:
            print("See All Summary Tapped")
            let allSummary = UIStoryboard(name: "BarStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "BarChartViewController") as! BarChartViewController

            self.tabBarController?.tabBar.isHidden = true

            navigationController?.show(allSummary, sender: self)
        default:
            print("Not Tapped")
        }

    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Data Jurnal ku 4, Minggu - Rabu
        if dataJournal.last!.dateJournal != dateToday{
            totalCard = dataJournal.count+1
            return totalCard
        }else{
            totalCard = dataJournal.count
            return totalCard
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var day = ""
//        day = dataJournal[indexPath.row].dateJournal!
        print("Data Journal CellForItemAt -> ", dataJournal)

        if indexPath.row < totalCard-1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell

            
            cell.setContent(date: dataJournal[indexPath.row].dateJournal!, day: day.getDay(date: dataJournal[indexPath.row].dateJournal!), feels: UIImage(named: "0\(indexPath.row+1)")!, emotion: "0\(indexPath.row+1)")

            return cell
        }else {
            //dataJournal[dataJournal.count-1] = dataJournal.last
            if dataJournal.last?.dateJournal != dateToday{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddNewCell", for: indexPath) as! AddNewCell
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell

                cell.setContent(date: dataJournal[indexPath.row].dateJournal!, day: day.getDay(date: dataJournal[indexPath.row].dateJournal!), feels: UIImage(named: "0\(indexPath.row+1)")!, emotion: "0\(indexPath.row+1)")

                return cell
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.row < dataJournal.count{
            let detailJournal = UIStoryboard(name: "Journal", bundle: nil).instantiateViewController(withIdentifier: "DetailJournalViewController") as! DetailJournalViewController

            self.tabBarController?.tabBar.isHidden = true

            navigationController?.show(detailJournal, sender: self)

        }else{
            let detailJournal = UIStoryboard(name: "Journaling", bundle: nil).instantiateViewController(withIdentifier: "IntroJournalingViewController") as! IntroJournalingViewController

            self.tabBarController?.tabBar.isHidden = true

            navigationController?.show(detailJournal, sender: self)
        }
    }
}

//MARK:- Set Life Cycle
extension HomeViewController{
    override func viewWillAppear(_ animated: Bool) {

        let indexToScrollTo = IndexPath(item: dataJournal.count-1, section: 0)

        self.collectionView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)

        navigationController?.setNavigationBarHidden(true, animated: animated)

        self.tabBarController?.tabBar.isHidden = false

    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)

    }
}

extension UILabel {
    func addCharacterSpacing(kernValue: Double = 1.15) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
