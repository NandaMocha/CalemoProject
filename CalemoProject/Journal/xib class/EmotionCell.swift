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
    
    var emotionProtocol: protocolView?
    
    let dataEmotion = DataManager.shared.dataEmotionAll
    
    

    @IBAction func emotionSlide(_ sender: Any) {
        let value = emotionSlider.value
        
        
        switch value {
        case 0...0.1:
            emotion.image = UIImage(named: "0")
            emotionText.text = dataEmotion[0].desc
            emotionProtocol?.emotionProtocol(emotionString: "0")
        case 0.1...0.2:
            emotion.image = UIImage(named: "1")
            emotionText.text = dataEmotion[1].desc
            emotionProtocol?.emotionProtocol(emotionString: "1")
        case 0.2...0.3:
            emotion.image = UIImage(named: "2")
            emotionText.text = dataEmotion[2].desc
            emotionProtocol?.emotionProtocol(emotionString: "2")
        case 0.3...0.4:
            emotion.image = UIImage(named: "3")
            emotionText.text = dataEmotion[3].desc
            emotionProtocol?.emotionProtocol(emotionString: "3")
        case 0.4...0.5:
            emotion.image = UIImage(named: "4")
            emotionText.text = dataEmotion[4].desc
            emotionProtocol?.emotionProtocol(emotionString: "4")
        case 0.5...0.6:
            emotion.image = UIImage(named: "5")
            emotionText.text = dataEmotion[5].desc
            emotionProtocol?.emotionProtocol(emotionString: "5")
        case 0.6...0.7:
            emotion.image = UIImage(named: "6")
            emotionText.text = dataEmotion[6].desc
            emotionProtocol?.emotionProtocol(emotionString: "6")
        case 0.7...0.8:
            emotion.image = UIImage(named: "7")
            emotionText.text = dataEmotion[7].desc
            emotionProtocol?.emotionProtocol(emotionString: "7")
        case 0.8...0.9:
            emotion.image = UIImage(named: "8")
            emotionText.text = dataEmotion[8].desc
            emotionProtocol?.emotionProtocol(emotionString: "8")
        case 0.9...1:
            emotion.image = UIImage(named: "9")
            emotionText.text = dataEmotion[9].desc
            emotionProtocol?.emotionProtocol(emotionString: "9")
        default:
            emotion.image = UIImage(named: "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(dataEmotion)
        
    }
}
