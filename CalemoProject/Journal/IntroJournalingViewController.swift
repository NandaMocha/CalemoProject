//
//  IntroJournalingViewController.swift
//  CalemoProject
//
//  Created by Wilbert xu on 17/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class IntroJournalingViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton()
        // Do any additional setup after loading the view.
    }
    
    func styleButton(){
        nextButton.layer.cornerRadius = 12
        nextButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        nextButton.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.7215686275, blue: 0.4862745098, alpha: 1)
        nextButton.setTitle("Let's Started", for: .normal)
        nextButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        nextButton.frame = CGRect(x: 48, y: 670, width: 318, height: 44)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
