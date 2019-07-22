//
//  CreateJournal.swift
//  CalemoProject
//
//  Created by Wilbert xu on 15/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class CreateJournal: UIViewController {
    
    @IBOutlet weak var inhaleText: UILabel!
    @IBOutlet weak var Centering: UIView!
    @IBOutlet weak var centeringBorder: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var x1 : CGFloat?
    var y1 : CGFloat?
    var x2 : CGFloat?
    var y2 : CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 2)
        progressView.progressTintColor = #colorLiteral(red: 0.9244551063, green: 0.7166977525, blue: 0.4467653632, alpha: 1)
        createCentering()
        
        
        
    }
    
    func createCentering(){
        x1 = Centering.center.x
        y1 = Centering.center.y
        x2 = centeringBorder.center.x
        y2 = centeringBorder.center.y
        Centering.layer.cornerRadius = Centering.frame.size.width/2
        Centering.clipsToBounds = true
        Centering.backgroundColor = #colorLiteral(red: 0.4235294118, green: 0.4078431373, blue: 0.4235294118, alpha: 1)
        centeringBorder.layer.cornerRadius = centeringBorder.frame.size.width/2
        centeringBorder.backgroundColor = #colorLiteral(red: 0.7339008451, green: 0.8349817395, blue: 0.7938916683, alpha: 1)
    }
    func centeringStart() {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat], animations: {//5
            self.Centering.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
        }) { (done)
            in
        }
        
       
        
        var  i : Int = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            true
            if i == 5{//4
                self.performSegue(withIdentifier: "centeringEnd", sender: self)
                timer.invalidate()
            }
            i += 1
            UIView.animate(withDuration: 1.0) {//20
                self.progressView.setProgress(1.0, animated: true)
            }
            
        })
        var timerBreath : Int = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            true
            //5
            if (timerBreath == 0 || timerBreath == 2 || timerBreath == 4  ) {
                self.inhaleText.text = "Exhale"
            } else {
                self.inhaleText.text = "Inhale"
            }
            timerBreath += 1
            if timerBreath == 5 {
                timer.invalidate()
            }
            print(timerBreath)

        })
    }
}

extension CreateJournal{
    override func viewWillAppear(_ animated: Bool) {
        centeringStart()
    }
}
    

