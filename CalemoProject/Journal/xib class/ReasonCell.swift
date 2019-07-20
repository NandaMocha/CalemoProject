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
    var reasonProtocol: protocolView?
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            reason = "Workload"
            reasonProtocol?.reasonProtocol(reasonString: "Workload")
        case 1:
            reason = "Environment"
             reasonProtocol?.reasonProtocol(reasonString: "Environment")
        case 2:
            reason = "Personal Relationship"
             reasonProtocol?.reasonProtocol(reasonString: "Personal Relationship")
        case 3:
            reason = "Mates"
             reasonProtocol?.reasonProtocol(reasonString: "Mates")
        case 4:
            reason = "Others"
             reasonProtocol?.reasonProtocol(reasonString: "Others")
        default:
            reason = ""
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
