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
            sender.setBackgroundImage(UIImage(named: "Workload-inactive"), for: .normal)
        case 1:
            reason = "Environment"
             reasonProtocol?.reasonProtocol(reasonString: "Environment")
            sender.setBackgroundImage(UIImage(named: "Env-inactive"), for: .normal)
        case 2:
            reason = "Personal Relationship"
             reasonProtocol?.reasonProtocol(reasonString: "Personal Relationship")
            sender.setBackgroundImage(UIImage(named: "Personal-inactive"), for: .normal)
        case 3:
            reason = "Mates"
             reasonProtocol?.reasonProtocol(reasonString: "Mates")
            sender.setBackgroundImage(UIImage(named: "Mates-inactive"), for: .normal)
        case 4:
            reason = "Others"
             reasonProtocol?.reasonProtocol(reasonString: "Others")
            sender.setBackgroundImage(UIImage(named: "Other-inactive"), for: .normal)
        default:
            reason = ""
        }
        
        DataManager.shared.causeDanger = reason
        print("Reason Cell Page, causeDanger = ", DataManager.shared.causeDanger)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
 
    
}
