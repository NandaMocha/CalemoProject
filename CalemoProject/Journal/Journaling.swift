//
//  Journaling.swift
//  CalemoProject
//
//  Created by Wilbert xu on 18/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class Journaling: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewJournaling: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageSwipe: UIPageControl!
    
    var emotionSave: String = "0"
    var reasonSave: String = "Workload"
    var questionSave: [String] = [String]()
    var answerSave: [String] = [String]()
    
    var index = 0
    
    override func viewDidLoad() {
        
        viewJournaling.register(UINib(nibName: "Emotion", bundle: nil), forCellWithReuseIdentifier: "emotionCell")
        viewJournaling.register(UINib(nibName: "Reason", bundle: nil), forCellWithReuseIdentifier: "reasonCell")
        viewJournaling.register(UINib(nibName: "Question", bundle: nil), forCellWithReuseIdentifier: "questionCell")
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
//        print("Journaling -> IndexBefore = ", index)
        
        index += 1
        if index < 6{
            var indexToScroll = IndexPath(row: index, section: 0)
//            viewJournaling.scrollToItem(at: indexToScroll, at: .left, animated: true)
            collectionView.selectItem(at: indexToScroll, animated: true, scrollPosition: .left)
            print("Journaling -> Current Index = ", index)
            
//            collectionView.reloadData()
        }
        if index == 6 {
            print("Journaling -> Current Index = ", index)
            self.nextButton.setTitle("Done", for: .normal)
        }
        
        if nextButton.currentTitle == "Done"{
            performSegue(withIdentifier: "unwindToHome", sender: self)        }
    }
    
    

}

extension Journaling: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("Journaling -> Index path = ", indexPath.row)
        if indexPath.row == 0 {
            print("Journaling -> Page Emotion")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emotionCell", for: indexPath) as! EmotionCell
            
            cell.emotionProtocol = self
            
            return cell
        }
        else if indexPath.row == 1 {
            print("Journaling -> Page Reason")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reasonCell", for: indexPath) as! ReasonCell
            
            cell.reasonProtocol = self
            
            return cell
            
        }
        else {
            print("Journaling -> Page Question")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "questionCell", for: indexPath) as! QuestionCell

            cell.questionProtocol = self
            print(index)
            if indexPath.row == 2{
                cell.question1.text = "What happened that made you be in such a good mood?"
            }else if indexPath.row == 3{
                cell.question1.text = "Why about it that makes you exceedingly happy?"
            }else if indexPath.row == 4{
                cell.question1.text = "What can you to do to further improve your environment?"
//                cell.castingQuestion(numberOfQuestion: indexPath.row, emotion: emotionSave, cause: reasonSave)
            }else if indexPath.row == 5{
                cell.question1.text = "Notes to Future Me?"
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
extension Journaling: protocolView {
    
    func emotionProtocol(emotionString: String) {
        print("Protocol Get Data Emotion, ", emotionString)
        emotionSave = emotionString
        
    }
    
    func reasonProtocol(reasonString: String) {
        print("Protocol Get Data Reason, ", reasonString)
        reasonSave = reasonString
    }
    
    func questionProtocol(questionString: String, answerString: String, questionNumber: Int) {
        print("Protocol Get Data Question, ", questionString, " And Answer ",answerString, "questionNumber is ", questionNumber)
    }
    
}
