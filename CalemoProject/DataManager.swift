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
    
    func saveJournalWith(date: String, feels: String, reason: String, question1: String, answer1: String, question2: String, answer2: String, question3: String, answer3: String, notes: String, image: Data){
        
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
    
}
