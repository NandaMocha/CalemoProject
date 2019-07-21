//
//  chooseSounds.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 20/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import AVKit

class chooseSounds: UIViewController {

    let arrayOfSounds = ["Light Rain", "Heavy Rain", "Bird Singing", "Ocean Waves"]
    var sounds = ""
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //remove the checkmark
        for i in 0 ..< arrayOfSounds.count{
            let index = IndexPath(item: i, section: 0)
            tableView.cellForRow(at: index)?.accessoryType = .none
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //add checkmark to selected row
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        switch indexPath.row {
        case 0:
            sounds = "lightrain"
        case 1:
            sounds = "heavyrain"
        case 2:
            sounds = "birdsinging"
        default:
            sounds = "oceanwaves"
        }
        
        playSound(sounds: sounds)
        
    
    }
    
}

extension chooseSounds: AVAudioPlayerDelegate{
    func playSound(sounds: String){
        print("Play sounds, ", sounds)
        
        let player: AVAudioPlayer?
        
        guard let url = Bundle.main.url(forResource: sounds, withExtension: "mp3") else {print("Data Not Found"); return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.delegate = self
            player.numberOfLoops = -1
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
        
        DataManager.shared.favoriteSounds = sounds
    }
}
