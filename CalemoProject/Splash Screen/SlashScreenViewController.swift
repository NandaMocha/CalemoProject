//
//  SlashScreenViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 19/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class SlashScreenViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var timer = Timer()
    let manager = DataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Slash Screen on Progress")
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        indicator.startAnimating()
        
        letsExecute()
    }
    
    func letsExecute(){
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
            self.loadData()
        })
    }
    
    func loadData(){
        manager.loadFromUserDefaults()
        
        if manager.isLoadEmotion != true || manager.isLoadQuotes != true || manager.isLoadQuestion != true{
            manager.saveDataFromRAW()
            manager.saveDummyJournal()
        }
        
        manager.loadDataFromRaw()
        manager.loadDummyJournal()
        
        if  DataManager.shared.isLoggedIn == true{
            performSegue(withIdentifier: "goToHome", sender: self)
        }else{
            performSegue(withIdentifier: "goToOnBoarding", sender: self)
        }

        indicator.stopAnimating()
    }

}
