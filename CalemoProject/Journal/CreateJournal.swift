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
    
//    let progress = Progress(totalUnitCount: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 2)
        progressView.progressTintColor = #colorLiteral(red: 0.9244551063, green: 0.7166977525, blue: 0.4467653632, alpha: 1)

        
        x = Centering.center.x
        y = Centering.center.y
   
        Centering.backgroundColor = UIColor(patternImage: (UIImage(named: "CC")!))
        centeringBorder.backgroundColor = UIColor(patternImage: (UIImage(named: "CCBg")!))
        
    }
    
    func centeringStart() {
        UIView.animate(withDuration: 4, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.Centering.transform = CGAffineTransform.identity.scaledBy(x: 1.6, y: 1.6)
//            self.progressView.setProgress(1, animated: true)
        }) { (done) in
            
//            self.progressView.progress = 0.0
            //            self.progress.completedUnitCount = 0
        }
        
        var  i : Int = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            true
            if i == 30{ self.performSegue(withIdentifier: "centeringEnd", sender: self)
            }
            i += 1
            
            UIView.animate(withDuration: 30.0) {
                self.progressView.setProgress(1.0, animated: true)
            }
//            UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>)
//            self.progressView.progress += 1 / 5
        })
        
        //                self.progress.completedUnitCount += 1
//        self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
        
    }
}

extension CreateJournal{
    override func viewWillAppear(_ animated: Bool) {
        centeringStart()
    }
}
    

