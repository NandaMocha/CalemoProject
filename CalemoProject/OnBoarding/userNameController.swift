//
//  userName.swift
//  CalemoProject
//
//  Created by M.Diaz Darmawan on 16/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class userNameController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet var background: UIView!
    var namaUser:String?
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        nameField.setBottomBorder()

        self.nameField.becomeFirstResponder()
        self.nameField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        DataManager.shared.isLoggedIn = true
        DataManager.shared.nameUser = nameField.text!
        DataManager.shared.saveToUserDefaults()
        return true
    }
    
    @IBAction func createJournalButton(_ sender: Any) {
        if nameField.text == "" {
            let alert = UIAlertController(title: "ouchh!", message: "Tell me your name please", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else{
            performSegue(withIdentifier: "toJournaling", sender: nil)
        }
    }
    @IBAction func tryLaterButton(_ sender: Any) {
        if nameField.text == "" {
            let alert = UIAlertController(title: "ouchh!", message: "Tell me your name please", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else{
            performSegue(withIdentifier: "toHome", sender: nil)
        }
    }
    
    

}


