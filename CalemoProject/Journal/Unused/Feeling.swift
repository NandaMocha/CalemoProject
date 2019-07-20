//
//  Journaling.swift
//  CalemoProject
//
//  Created by Wilbert xu on 15/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class Feeling: UIViewController {
    
    @IBOutlet weak var Emotion: UIImageView!
    @IBOutlet weak var EmotionSlider: UISlider!
    @IBOutlet weak var EmotionButton: UIButton!
    
    override func viewDidLoad() {
        Emotion.image = UIImage(named: "0")
        
        super.viewDidLoad()
        
    }
    
    @IBAction func EmotionSlide(_ sender: Any) {
        let value = EmotionSlider.value
        
        switch value {
        case 0...0.09:
            Emotion.image = UIImage(named: "0")
        case 0.1...0.19:
            Emotion.image = UIImage(named: "1")
        case 0.2...0.29:
            Emotion.image = UIImage(named: "2")
        case 0.3...0.39:
            Emotion.image = UIImage(named: "3")
        case 0.4...0.49:
            Emotion.image = UIImage(named: "4")
        case 0.5...0.59:
            Emotion.image = UIImage(named: "5")
        case 0.6...0.69:
            Emotion.image = UIImage(named: "6")
        case 0.7...0.79:
            Emotion.image = UIImage(named: "7")
        case 0.8...0.89:
            Emotion.image = UIImage(named: "8")
        case 0.9...1:
            Emotion.image = UIImage(named: "9")
        default:
            Emotion.image = UIImage(named: "0")
        }
    
}
}
