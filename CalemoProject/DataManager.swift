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
    var dataJurnalTujuHari : [Journal] = [Journal]()
    var dataQuestionAll : [Question] = [Question]()
    var dataAchievementAll : [Achievement] = [Achievement]()
    var dataEmotionAll : [Emotion] = [Emotion]()
    var dataQuotesAll : [Quotes] = [Quotes]()
    
    //MARK:- Declare Variable Global
    var isLoggedIn = false
    var nameUser = ""
    
    //MARK:- Declare Flag Variable to Check status
    var isLoadDummy = false
    var isLoadQuestion = false
    var isLoadQuotes = false
    var isLoadEmotion = false
    
    //MARK:- Dangerous Variable
    var causeDanger = "Workload"
    
    //MARK:- Variable to save favorites Sounds
    var favoriteSounds = "lightrain"
    
    //MARK:- Save and Load User Defaults
    let defaults = UserDefaults.standard
    
    func saveToUserDefaults() {
        defaults.set(isLoggedIn, forKey: "isLoggedIn")
        defaults.set(isLoadDummy, forKey: "isLoadDummy")
        defaults.set(isLoadQuestion, forKey: "isLoadQuestion")
        defaults.set(isLoadQuotes, forKey: "isLoadQuotes")
        defaults.set(isLoadEmotion, forKey: "isLoadEmotion")
        
        defaults.set(favoriteSounds, forKey: "favoriteSounds")
        
        defaults.set(nameUser, forKey: "namaUser")
        
        print("Save DataManager Done")
    }
    
    func loadFromUserDefaults() {
        isLoggedIn = defaults.bool(forKey: "isLoggedIn")
        isLoadDummy = defaults.bool(forKey: "isLoadDummy")
        isLoadQuestion = defaults.bool(forKey: "isLoadQuestion")
        isLoadQuotes = defaults.bool(forKey: "isLoadQuotes")
        isLoadEmotion = defaults.bool(forKey: "isLoadEmotion")
        
        guard let sound = defaults.string(forKey: "favoriteSounds") else{ return}
        favoriteSounds = sound
        
        guard let nama = defaults.string(forKey: "namaUser") else{ return}
        if nama != ""{nameUser = nama}
        
        print("Load UserDefaults Done ")
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
//            dataJournal[0].answerOneJournal
        } catch  {
            print("Error Appeared When Fetch Journal")
        }
    }
    
    //MARK:- Load and Fetch Dummy Journal
    var journalDataLoadDummy: [Journal] = [Journal]()

    func saveDummyJournal(){
        
        journalDataLoadDummy.removeAll()
        
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

            for data in object{
                print("Here is Data that Stored",data)
            
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
            
            isLoadDummy = true
            saveToUserDefaults()
            
            do {
                try context.save()
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
        
        journalDataLoadDummy.removeAll()

        do {
            journalDataLoadDummy = try context.fetch(request)

            let sortData = journalDataLoadDummy.sorted(by: {
                let data1: Date = data.theDate(dateString: ($0.dateJournal)!)
                let data2: Date = data.theDate(dateString: ($1.dateJournal)!)
                
                filterJurnalTujuHari(dataJurnal: journalDataLoadDummy)
                
                return data1 < data2
            })
            
            journalDataLoadDummy = sortData
            
        } catch  {
            print("Error Appeared When Fetch Journal")
        }
    }
    
    func filterJurnalTujuHari(dataJurnal: [Journal]){
        let date = ""
        let dateToday = date.getDate()
        
        //Remove the content befor it filled
        dataJurnalTujuHari.removeAll()
        
        //check is the latest data is today or not
        if dataJurnal[dataJurnal.count-1].dateJournal != dateToday{
            //give a condition if the data more than 7 days,
            if dataJurnal.count > 7{
                for i in 0 ..< 7{
                    dataJurnalTujuHari.append(dataJurnal[i])
                    print("Contents of Journal -> ",dataJurnal[i])
                }
            }else{
                for i in 0 ..< dataJurnal.count - 1{
                    dataJurnalTujuHari.append(dataJurnal[i])
                }
            }
        }
    }
    
    //MARK:- Save Data Question to Core Data from CSV
    func saveDataFromRAW(){
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        do{
            guard let fileQuestion = Bundle.main.url(forResource: "listQuestion", withExtension: "json") else {print("json raw question not found");return}
            guard let fileEmotion = Bundle.main.url(forResource: "listEmotion", withExtension: "json") else {print("json raw emotion not found");return}
            guard let fileQuotes = Bundle.main.url(forResource: "quotes", withExtension: "json") else {print("json raw quotes not found");return}


            //Question Fetch Process
            let dataQuestion = try Data(contentsOf: fileQuestion)
            let jsonQuestion = try JSONSerialization.jsonObject(with: dataQuestion, options: [])

            guard let question = jsonQuestion as? [[String: String]] else { print("json question invalid"); return}

            for dataQuest in question{
                print("Here is Data Question that Stored",dataQuest)

                let quest = Question(context: self.context)
                quest.questionQuest = dataQuest["Pertanyaan"]
                quest.emotionQuest = dataQuest["Emotion"]
                quest.causeQuest = dataQuest["Cause"]
                quest.typeQuest = dataQuest["Tipe Pertanyaan"]

                dataQuestionAll.append(quest)

            }
            
            //Emotion Fetch Process
            let dataEmotion = try Data(contentsOf: fileEmotion)
            let jsonEmotion = try JSONSerialization.jsonObject(with: dataEmotion, options: [])
            print("Cek JSON EMotion, ", jsonEmotion)

            guard let emotion = jsonEmotion as? [[String: Any]] else { print("json emotion invalid"); return}

            for dataEmotion in emotion{
                print("Here is Data Emotion that Stored",dataEmotion)

                let emo = Emotion(context: self.context)
                emo.desc = dataEmotion["Description"] as! String
                emo.emotion = dataEmotion["Emotion"] as! String
                emo.number = dataEmotion["Number"] as! Int16

                dataEmotionAll.append(emo)

            }

            //Quotes Fetch Process
            let dataQuotes = try Data(contentsOf: fileQuotes)
            let jsonQuotes = try JSONSerialization.jsonObject(with: dataQuotes, options: [])

            guard let quotes = jsonQuotes as? [[String: String]] else { print("json quotes invalid"); return}

            for dataQuotes in quotes{
                print("Here is Data Quotes that Stored",dataQuotes)

                let quotes = Quotes(context: self.context)
                quotes.author = dataQuotes["Author"]
                quotes.quotes = dataQuotes["Quotes"]

                dataQuotesAll.append(quotes)

            }
            
            isLoadQuestion = true
            isLoadQuotes = true
            isLoadEmotion = true
            
            saveToUserDefaults()
            
            
            
            do {
                try context.save()
                
            } catch {
                print("Error Save Data, ", error)
            }
        
        }catch  {
            print("Error load Dummy Data, ", error.localizedDescription)
        }
    }
    
    func loadDataFromRaw() {
        print("Load Data Raw")
        let requestQuestion : NSFetchRequest = Question.fetchRequest()
        let requestEmotion : NSFetchRequest = Emotion.fetchRequest()
        let requestQuotes : NSFetchRequest = Quotes.fetchRequest()
        
        dataQuestionAll.removeAll()
        dataEmotionAll.removeAll()
        dataQuotesAll.removeAll()
        
        var dataquestion = [Question]()
        var dataemotion = [Emotion]()
        var dataquotes = [Quotes]()
        
        do {
            dataQuestionAll = try context.fetch(requestQuestion)
            dataEmotionAll = try context.fetch(requestEmotion)
            dataemotion = dataEmotionAll.sorted(by: {$0.number < $1.number})
            dataEmotionAll = dataemotion
            dataQuotesAll = try context.fetch(requestQuotes)
            
        } catch  {
            print("Error Appeared When Fetch Data Raw")
        }
    }
    
    
    
    
}
