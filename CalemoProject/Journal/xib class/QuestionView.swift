//
//  QuestionView.swift
//  CalemoProject
//
//  Created by Wilbert xu on 18/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class QuestionCell: UICollectionViewCell {

    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var answer1: UITextField!
    var answerView1: String?
    var questionView1: String?
    
    var questionProtocol: protocolView?
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setContent(numberQuestion: Int){
        switch numberQuestion {
        case 0:
            print("1")
            questionProtocol?.questionProtocol(questionString: "1", answerString: "")
        case 1:
            print("2")
            questionProtocol?.questionProtocol(questionString: "2", answerString: "3")
        case 2:
            print("3")
            questionProtocol?.questionProtocol(questionString: "3", answerString: "3")
        case 3:
            print("4")
            questionProtocol?.questionProtocol(questionString: "4", answerString: "4")
        default:
            print("no Question")
        }
    }
}
