//
//  ViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 01/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

extension UIView{
    func viewShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 15)
        self.layer.shadowRadius = 18
        self.layer.shouldRasterize = true
        
    }
}

extension UIButton{
    func buttonShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 10)
        self.layer.shadowRadius = 5
        self.layer.shouldRasterize = true
    }
}
