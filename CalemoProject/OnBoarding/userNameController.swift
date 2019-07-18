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
        return true
    }
    @IBAction func createJournalButton(_ sender: Any) {
        namaUser = nameField.text
        defaults.set(namaUser, forKey: "namaUser")
    }
    @IBAction func tryLaterButton(_ sender: Any) {
        
    }
    
    

}


