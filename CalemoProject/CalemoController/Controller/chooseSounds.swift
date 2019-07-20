//
//  chooseSounds.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 20/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class chooseSounds: UIViewController {

    let arrayOfSounds = ["Light Rain", "Heavy Rain", "Bird Singing", "Ocean Waves"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension chooseSounds: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSounds") as! cellSounds
        
        cell.labelCell.text = arrayOfSounds[indexPath.row]
        
        return cell
    }
    
    
}
