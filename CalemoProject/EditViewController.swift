//
//  ViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 01/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var futureField: UITextField!
    @IBOutlet weak var q3Field: UITextField!
    @IBOutlet weak var q2Field: UITextField!
    @IBOutlet weak var q1Field: UIView!
    @IBOutlet weak var futureLabel: UILabel!
    @IBOutlet weak var q3Label: UILabel!
    @IBOutlet weak var q2Label: UILabel!
    @IBOutlet weak var q1Label: UILabel!
    @IBOutlet weak var causeImg: UIImageView!
    @IBOutlet weak var emotionImg: UIImageView!
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var causeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit journal"
        
        emotionLabel.text = "Pretty bad"
        causeLabel.text = "Workload"
        
        q1Label.text = "So what exactly happened earlier?"
        q1Label.lineBreakMode = .byWordWrapping
        q1Label.numberOfLines = 0
        
        q2Label.text = "What are the things you'd want to change?"
        q2Label.lineBreakMode = .byWordWrapping
        q2Label.numberOfLines = 0
        
        q3Label.text = "Is it possible to change that? If not what's the workaround?"
        q3Label.lineBreakMode = .byWordWrapping
        q3Label.numberOfLines = 0
        
        futureLabel.text = "Notes for future me:"
        futureLabel.lineBreakMode = .byWordWrapping
        futureLabel.numberOfLines = 0
        
        

        // Do any additional setup after loading the view.
    }
}
