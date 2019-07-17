//
//  CreateJournal.swift
//  CalemoProject
//
//  Created by Wilbert xu on 15/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class CreateJournal: UIViewController {
    
    @IBOutlet weak var Centering: UIView!
    @IBOutlet weak var centeringBorder: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var x : CGFloat?
    var y : CGFloat?
    
    let progress = Progress(totalUnitCount: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        x = Centering.center.x
        y = Centering.center.y
        
    Centering.layer.cornerRadius = Centering.frame.height / 2
    centeringBorder.layer.cornerRadius = centeringBorder.frame.height / 2
        
    }
    @IBAction func centeringStart(_ sender: UIButton) {
        UIView.animate(withDuration: 4, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.Centering.transform = CGAffineTransform.identity.scaledBy(x: 1.6, y: 1.6)
        }) { (done) in
            self.Centering.frame = CGRect(x: 45, y: 45, width: 150, height: 150)
            
            self.progressView.progress = 0.0
//            self.progress.completedUnitCount = 0
        }
           
            var  i : Int = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                true
                if i == 5{ self.performSegue(withIdentifier: "centeringEnd", sender: self)
                }
                i += 1
                self.progressView.progress += 1 / 5
            })
                
//                self.progress.completedUnitCount += 1
                self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
        
        }
    }
    

