//
//  AddNewCellCollectionViewCell.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 16/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class AddNewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBG: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBG.backgroundColor = UIColor(patternImage: UIImage(named: "cardPutus")!)
        
    }
}
