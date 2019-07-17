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
        Emotion.image = UIImage(named: "emotion")
        
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var EmotionChange: UIImageView!
    @IBAction func EmotionSlide(_ sender: Any) {
        let value = EmotionSlider.value
        
        switch value {
        case 0...0.5:
            Emotion.image = UIImage(named: "emotion")
        case 0.6...1:
            Emotion.image = UIImage(named: "ayam")
        default:
            Emotion.image = UIImage(named: "emotion")
        }
    
}
}
