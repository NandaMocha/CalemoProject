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

class DataManager{
    
    let shared = DataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(){}
    
    //Mark:- Declare Variable
    var dataJournal : [Journal]?
    
    
    func saveJournal(){
    }
    
    func getJournal(){
        
    }
    
}
