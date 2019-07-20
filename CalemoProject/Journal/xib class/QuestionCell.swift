//
//  QuestionView.swift
//  CalemoProject
//
//  Created by Wilbert xu on 18/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class QuestionCell: UICollectionViewCell, UITextFieldDelegate {

    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var answer1: UITextField!
    var answerView1: String?
    var questionView1: String?
    var questionNumber = 0
    
    var questionProtocol: protocolView?
    
    let dataQuestion = DataManager.shared.dataQuestionAll
    
    var selectedEmotion = [Question]()
    var selectedCause = [Question]()
    var selectedType = [Question]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        answer1.delegate = self
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        let tapGestures = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        
        questionView.addGestureRecognizer(tapGestures)
        
        
    }
    
    @objc func viewTapped(){
        answer1.endEditing(true)
        questionProtocol?.questionProtocol(questionString: question1.text ?? "No Data Added", answerString: answer1.text ?? "No Data Added", questionNumber: questionNumber)
    }
    
    @objc func adjustForKeyboard(notification: Notification){
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = questionView.convert(keyboardScreenEndFrame, from: questionView.window)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.questionView.endEditing(true)
        questionProtocol?.questionProtocol(questionString: question1.text ?? "No Data Added", answerString: answer1.text ?? "No Data Added", questionNumber: questionNumber)
        return false
    }
    
    //First Execute
    func castingQuestion(numberOfQuestion: Int, emotion: String, cause: String) {
        var selectedEmotion = ""
        var selectedQuestion = ""
        questionNumber = numberOfQuestion
        
        switch numberOfQuestion {
        case 2:
            selectedQuestion = "1. What happen"
        case 3:
            selectedQuestion = "2. Why you feel so"
        case 4:
            selectedQuestion = "3. Now what to improve"
        default:
            selectedQuestion = "Notes to future me?"
        }
        
        if emotion == "0" || emotion == "1" {
            selectedEmotion = "Very Bad"
        } else if emotion == "2" || emotion == "3" || emotion == "4" {
            selectedEmotion = "Flat to Bad"
        }else if emotion == "5" || emotion == "6" || emotion == "7" {
            selectedEmotion = "Flat to Good"
        }else if emotion == "8" || emotion == "9" {
            selectedEmotion = "Very Good"
        }
        
        print("QuestioCell -> Selected Cause = ", DataManager.shared.causeDanger)
        
        setQuestion(typeOfQuestion: selectedQuestion, emotion: selectedEmotion, cause: DataManager.shared.causeDanger)
        
    }
    
    func setQuestion(typeOfQuestion: String, emotion: String, cause: String){
        
        var theQuestionIs = Question()
        
            //Iterate the dataQuestion to get data where have same emotion with selected emotion
            for i in 0 ..< dataQuestion.count{
                if dataQuestion[i].emotionQuest == emotion{
                    selectedEmotion.append(dataQuestion[i])
                }
            }
            
            if selectedEmotion.count != 0{
                for i in 0 ..< selectedEmotion.count{
                    if selectedEmotion[i].causeQuest == cause{
                        selectedCause.append(selectedEmotion[i])
                    }
                }
                if selectedCause.count != 0{
                    for i in 0 ..< selectedCause.count{
                        if selectedCause[i].typeQuest == typeOfQuestion{
                            selectedType.append(selectedCause[i])
                            theQuestionIs = selectedType.randomElement()!
                        }
                    }
                }else{
                    print("Selected Cause Total is ", selectedCause.count)
                }
                
            }else{
                print("Selected Emotion Total is ", selectedEmotion.count)
            }
        
        if typeOfQuestion == "Notes to future me?"{
            question1.text = "Notes to future me?"
        }
        print("Selected Type: ", selectedType)
        print("Data Selected Type : ", theQuestionIs)
        if let question = theQuestionIs.questionQuest{
            if question != "Notes to future me?"{
                question1.text = question
            }
        }
        
        selectedType.removeAll()
        selectedEmotion.removeAll()
        selectedCause.removeAll()
        
        
    }
}
