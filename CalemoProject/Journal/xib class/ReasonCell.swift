//
//  ReasonView.swift
//  CalemoProject
//
//  Created by Wilbert xu on 18/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class ReasonCell: UICollectionViewCell {

    var reason = ""
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            reason = "Workload"
        case 1:
            reason = "Environment"
        case 2:
            reason = "Personal Relationship"
        case 3:
            reason = "Mates"
        case 4:
            reason = "Others"

        default:
            reason = ""
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
