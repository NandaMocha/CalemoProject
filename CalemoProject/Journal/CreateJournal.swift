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
    
        progressView.transform = progressView.transform.scaledBy(x: 333, y: 12)
        progressView.progressTintColor = #colorLiteral(red: 0.9244551063, green: 0.7166977525, blue: 0.4467653632, alpha: 1)
            progressView.trackTintColor = #colorLiteral(red: 0.5921100378, green: 0.5921833515, blue: 0.5920851827, alpha: 1)
        
        x = Centering.center.x
        y = Centering.center.y
   
        Centering.backgroundColor = UIColor(patternImage: (UIImage(named: "CC")!))
        centeringBorder.backgroundColor = UIColor(patternImage: (UIImage(named: "CCBg")!))
        
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
    

