//
//  ViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 01/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

extension UIView{
    func viewShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 15)
        self.layer.shadowRadius = 18
        self.layer.shouldRasterize = true
        
    }
}

extension UIButton{
    func buttonShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 10)
        self.layer.shadowRadius = 5
        self.layer.shouldRasterize = true
    }
}

extension String{
    func getDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        let resultDate = formatter.string(from: date)
        
        return resultDate
    }
    
    func getDay(date: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        let date = formatter.date(from: date)
        
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: date!)
        
        var day = ""
        switch weekDay {
        case 1:
            day = "Sunday"
        case 2:
            day = "Monday"
        case 3:
            day = "Tuesday"
        case 4:
            day = "Wednesday"
        case 5:
            day = "Thursday"
        case 6:
            day = "Friday"
        case 7:
            day = "Saturday"
        default:
            print("Date is not available")
        }
        print("\(String(describing: date)) is \(day)")
        
        return day
    }
    
    func theDate(dateString: String) -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        let date = formatter.date(from: dateString)
        
        return date!
    }
}

    extension UITextField{
    func setBottomBorder(){
        self.borderStyle = .none
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.masksToBounds = false
        self.layer.shadowColor = #colorLiteral(red: 0.4222604036, green: 0.4070479274, blue: 0.4247793555, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        
    }
}

protocol protocolView {
    func emotionProtocol(emotionString: String)
    func reasonProtocol(reasonString: String)
    func questionProtocol(questionString: String, answerString: String, questionNumber: Int)
}
