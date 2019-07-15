//
//  HomeViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 15/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button : UIButton = UIButton(type: .custom)
        
        button.setImage(UIImage(named: "user"), for: .normal)
        button.addTarget(self, action: #selector(goToMe), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    @objc func goToMe(){
        
    }

}
