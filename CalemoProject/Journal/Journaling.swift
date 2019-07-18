//
//  Journaling.swift
//  CalemoProject
//
//  Created by Wilbert xu on 18/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class Journaling: UIViewController {

    @IBOutlet weak var viewJournaling: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageSwipe: UIPageControl!
    
    var index = 0
    
    override func viewDidLoad() {
        
        viewJournaling.register(UINib(nibName: "Emotion", bundle: nil), forCellWithReuseIdentifier: "emotionCell")
        viewJournaling.register(UINib(nibName: "Reason", bundle: nil), forCellWithReuseIdentifier: "reasonCell")
        viewJournaling.register(UINib(nibName: "Question", bundle: nil), forCellWithReuseIdentifier: "questionCell")
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        index += 1
        var indexToScroll = IndexPath(row: index, section: 0)
        viewJournaling.scrollToItem(at: indexToScroll, at: .left, animated: true)
//        viewJournaling.sc
    }
    
    

}

extension Journaling: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emotionCell", for: indexPath) as! EmotionCell
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reasonCell", for: indexPath) as! ReasonCell
            
            return cell
            
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "questionCell", for: indexPath) as! QuestionCell
            if indexPath.row == 2 {
                cell.setContent(numberQuestion: 1)
            }
            else if indexPath.row == 3 {
                cell.setContent(numberQuestion: 2)

            }
            else if indexPath.row == 4 {
                cell.setContent(numberQuestion: 3)

            }
            else  {
                cell.setContent(numberQuestion: 4)

            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
