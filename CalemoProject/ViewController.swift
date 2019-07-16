//
//  ViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 01/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var futureAnswer: UILabel!
    @IBOutlet weak var q4Answer: UILabel!
    @IBOutlet weak var q3Answer: UILabel!
    @IBOutlet weak var q2Answer: UILabel!
    @IBOutlet weak var q1Answer: UILabel!
    @IBOutlet weak var futureLabel: UILabel!
    @IBOutlet weak var q4Label: UILabel!
    @IBOutlet weak var q3Label: UILabel!
    @IBOutlet weak var q2Label: UILabel!
    @IBOutlet weak var q1Label: UILabel!
    @IBOutlet weak var causeImg: UIImageView!
    @IBOutlet weak var emotionImg: UIImageView!
    @IBOutlet weak var causeLabel: UILabel!
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var dateLabel: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionLabel.text = "Pretty bad"
        causeLabel.text = "Workload"
        q1Label.text = "So what exactly happened earlier?"
      //  q1Label.frame = CGRect(x: self.q1Label.frame.origin.x, y: self.q1Label.frame.origin.y, width: q1Label.intrinsicContentSize.width, height: q1Label.intrinsicContentSize.height)
        q1Label.lineBreakMode = .byWordWrapping
        q1Label.numberOfLines = 0
        q2Label.text = "What are the things you'd want to change?"
                //q2Label.frame = CGRect(x: self.q2Label.frame.origin.x, y: self.q2Label.frame.origin.y, width: q2Label.intrinsicContentSize.width, height: q2Label.intrinsicContentSize.height)
        q2Label.lineBreakMode = .byWordWrapping
        q2Label.numberOfLines = 0
        q3Label.text = "Is it possible to change that? If not whats the workaround?"
        q3Label.lineBreakMode = .byWordWrapping
        q3Label.numberOfLines = 0
        q4Label.text = "So whats the next step?"
        q4Label.lineBreakMode = .byWordWrapping
        q4Label.numberOfLines = 0
        futureLabel.text = "Notes for future me:"
        futureLabel.lineBreakMode = .byWordWrapping
        futureLabel.numberOfLines = 0
        
        q1Answer.text = "Ms. Reni was giving me so much work and threatening to bite me if I don’t finish it. it’s so scary like omg I’m gonna die"
        //q1Answer.frame = CGRect(x: self.q1Answer.frame.origin.x, y: self.q1Answer.frame.origin.y, width: q1Answer.intrinsicContentSize.width, height: q1Answer.intrinsicContentSize.height)
        q1Answer.lineBreakMode = .byWordWrapping
        q1Answer.numberOfLines = 0
        q2Answer.text = "Less workload obviously"
       // q2Answer.frame = CGRect(x: self.q2Answer.frame.origin.x, y: self.q2Answer.frame.origin.y, width: q2Answer.intrinsicContentSize.width, height: q2Answer.intrinsicContentSize.height)
        q2Answer.lineBreakMode = .byWordWrapping
        q2Answer.numberOfLines = 0
        q3Answer.text = "I don’t think I can change the amount of workload… I think I’d have better motivation if I had friends towork with tho"
       // q3Answer.frame = CGRect(x: self.q3Answer.frame.origin.x, y: self.q3Answer.frame.origin.y, width: q3Answer.intrinsicContentSize.width, height: q3Answer.intrinsicContentSize.height)
        q3Answer.lineBreakMode = .byWordWrapping
        q3Answer.numberOfLines = 0
        q4Answer.text = "I’ll try and give Willy and Mocha a call, I’m sure they’re as stressed as I am and at least we can work and have fun together I think"
       // q4Answer.frame = CGRect(x: self.q4Answer.frame.origin.x, y: self.q4Answer.frame.origin.y, width: q4Answer.intrinsicContentSize.width, height: q4Answer.intrinsicContentSize.height)
        q4Answer.lineBreakMode = .byWordWrapping
        q4Answer.numberOfLines = 0
        futureAnswer.text = "Don’t forget to get some snacks before we get together!"
        futureAnswer.lineBreakMode = .byWordWrapping
        futureAnswer.numberOfLines = 0
        
        // Do any additional setup after loading the view.
    }
}
