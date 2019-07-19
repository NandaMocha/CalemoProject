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
        case 1:
            print("2")
        case 2:
            print("3")
        case 3:
            print("4")
        default:
            print("no Question")
        }
    }
}
