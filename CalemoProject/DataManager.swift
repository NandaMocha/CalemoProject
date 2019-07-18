//
//  DataManager.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 15/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import CoreData
import Foundation

final class DataManager {
    
    static let shared = DataManager()
    private init(){}

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Mark:- Declare Variable Entity
    var dataJournal : [Journal] = [Journal]()
    
    
    //MARK:- Declare Variable Global
    var isOnBoardingDone = false
    var isLoadDummyDone = false
    
    //MARK:- Save and Load User Defaults
    let defaults = UserDefaults.standard
    
    func saveToUserDefaults() {
        defaults.set(isLoadDummyDone, forKey: "isLoadDummyDone")
        
        print("New Data has been Saved")
    }
    
    func loadFromUserDefaults() {
        isLoadDummyDone = defaults.bool(forKey: "isLoadDummyDone")
        print("Load Data Dummy is ", isLoadDummyDone)
    }
    
    //MARK:- Load and Fetch Journal
    func saveJournalWith(date: String, feels: String, reason: String, question1: String, answer1: String, question2: String, answer2: String, question3: String, answer3: String, notes: String, image: String){
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        let journal = Journal(context: self.context)
        
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
        
        dataJournal.append(journal)
        
        do {
            try context.save()
        } catch  {
            print("Error appeared")
        }
    }
    
    func loadJournal(){
        let request : NSFetchRequest = Journal.fetchRequest()
        
        do {
            dataJournal = try context.fetch(request)
        } catch  {
            print("Error Appeared When Fetch Journal")
        }
    }
    
    //MARK:- Load and Fetch Dummy Journal
    var journalDataLoadDummy: [Journal] = [Journal]()

    func saveDummyJournal(){
        do {
            print("Saved Dummy Journal into, ")
            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
            
            guard let file = Bundle.main.url(forResource: "journalDummy", withExtension: "json") else {
                print("json raw not found")
                return
            }
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let object = json as? [[String: String]] else { print("json invalid"); return}
//            print("Data Dummy JSON is, ", object)
            
            for data in object{
                print(data)
            
                let journalLoadDummy = Journal(context: self.context)
                journalLoadDummy.dateJournal = data["date"]
                journalLoadDummy.feelsJournal = data["feels"]
                journalLoadDummy.reasonJournal = data["reason"]
                journalLoadDummy.questionOneJournal = data["questionOne"]
                journalLoadDummy.answerOneJournal = data["answerOne"]
                journalLoadDummy.questionTwoJournal = data["questionTwo"]
                journalLoadDummy.answerTwoJournal = data["answerTwo"]
                journalLoadDummy.questionThreeJournal = data["questionThree"]
                journalLoadDummy.answerThreeJournal = data["answerThree"]
                journalLoadDummy.notesJournal = data["notes"]
                journalLoadDummy.imageJournal = data["image"]

                journalDataLoadDummy.append(journalLoadDummy)
                
            }
            
            do {
                try context.save()
                isLoadDummyDone = true
                saveToUserDefaults()
            } catch {
                print("Error Save Data, ", error)
            }
            
        } catch  {
            print("Error load Dummy Data, ", error.localizedDescription)
        }
    }
    
    func loadDummyJournal() {
        print("Load Data Dummy Journal")
        let request : NSFetchRequest = Journal.fetchRequest()
        let data = ""

        do {
            journalDataLoadDummy = try context.fetch(request)

            let sortData = journalDataLoadDummy.sorted(by: {
                let data1: Date = data.theDate(dateString: ($0.dateJournal)!)
                let data2: Date = data.theDate(dateString: ($1.dateJournal)!)
                return data1 < data2
            })
            
            journalDataLoadDummy = sortData
        } catch  {
            print("Error Appeared When Fetch Journal")
        }
    }
    
    
    
}
