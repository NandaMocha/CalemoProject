//
//  EmotionView.swift
//  CalemoProject
//
//  Created by Wilbert xu on 18/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class EmotionCell: UICollectionViewCell {

    
    @IBOutlet weak var emotion: UIImageView!
    @IBOutlet weak var emotionSlider: UISlider!
    @IBOutlet weak var emotionText: UILabel!

    @IBAction func emotionSlide(_ sender: Any) {
        let value = emotionSlider.value
        
        switch value {
        case 0...0.09:
            emotion.image = UIImage(named: "0")
        case 0.1...0.19:
            emotion.image = UIImage(named: "1")
        case 0.2...0.29:
            emotion.image = UIImage(named: "2")
        case 0.3...0.39:
            emotion.image = UIImage(named: "3")
        case 0.4...0.49:
            emotion.image = UIImage(named: "4")
        case 0.5...0.59:
            emotion.image = UIImage(named: "5")
        case 0.6...0.69:
            emotion.image = UIImage(named: "6")
        case 0.7...0.79:
            emotion.image = UIImage(named: "7")
        case 0.8...0.89:
            emotion.image = UIImage(named: "8")
        case 0.9...1:
            emotion.image = UIImage(named: "9")
        default:
            emotion.image = UIImage(named: "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
