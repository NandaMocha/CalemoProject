//
//  userName.swift
//  CalemoProject
//
//  Created by M.Diaz Darmawan on 16/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class userNameController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet var background: UIView!
    var namaUser:String?
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        nameField.setBottomBorder()
        createButton()

        self.nameField.becomeFirstResponder()
        self.nameField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func saveValue(){
        DataManager.shared.isLoggedIn = true
        DataManager.shared.nameUser = nameField.text!
        DataManager.shared.saveToUserDefaults()
    }
    
    func createButton(){
        
        nextButton.layer.cornerRadius = 12
        nextButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        nextButton.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.7215686275, blue: 0.4862745098, alpha: 1)
        nextButton.setTitle("Let's create first journal", for: .normal)
        nextButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        nextButton.frame = CGRect(x: 48, y: 670, width: 318, height: 44)
    }
    
    
    @IBAction func createJournalButton(_ sender: Any) {
        
        if nameField.text == "" {
            let alert = UIAlertController(title: "ouchh!", message: "Tell me your name please", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else{
            
            saveValue()
            
            performSegue(withIdentifier: "toJournaling", sender: nil)
        }
    }
    @IBAction func tryLaterButton(_ sender: Any) {
        if nameField.text == "" {
            let alert = UIAlertController(title: "ouchh!", message: "Tell me your name please", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else{
            
            saveValue()
            
            performSegue(withIdentifier: "toHome", sender: nil)
        }
    }
    
    

}


