//
//  HomeCell.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 15/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var dayJournal: UILabel!
    @IBOutlet weak var feelsJournal: UIImageView!
    @IBOutlet weak var dateJournal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContent(date: String, day: String, feels: UIImage, emotion: String){
        dateJournal.text = date
        dayJournal.text = day
        feelsJournal.image = feels
        layer.cornerRadius = 20
        print("Emotion-> Emotion")
        switch emotion {
        case "00":
            layer.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7803921569, blue: 0.8235294118, alpha: 1)
        case "01":
            layer.backgroundColor = #colorLiteral(red: 0.7137254902, green: 0.7529411765, blue: 0.8352941176, alpha: 1)
        case "02":
            layer.backgroundColor = #colorLiteral(red: 0.6588235294, green: 0.7647058824, blue: 0.7568627451, alpha: 1)
        case "03":
            layer.backgroundColor = #colorLiteral(red: 0.8, green: 0.8745098039, blue: 0.7058823529, alpha: 1)
        case "04":
            layer.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.8235294118, blue: 0.7058823529, alpha: 1)
        case "05":
            layer.backgroundColor = #colorLiteral(red: 1, green: 0.9725490196, blue: 0.831372549, alpha: 1)
        case "06":
            layer.backgroundColor = #colorLiteral(red: 1, green: 0.8588235294, blue: 0.5647058824, alpha: 1)
        case "07":
            layer.backgroundColor = #colorLiteral(red: 1, green: 0.7490196078, blue: 0.5254901961, alpha: 1)
        case "08":
            layer.backgroundColor = #colorLiteral(red: 1, green: 0.7411764706, blue: 0.6823529412, alpha: 1)
        default:
            layer.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.6352941176, blue: 0.5529411765, alpha: 1)
        }
    }

}
