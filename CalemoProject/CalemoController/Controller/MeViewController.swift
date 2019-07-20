//
//  MeViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 16/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet weak var timePickButton: UIButton!
    @IBOutlet weak var switchReminder: UISwitch!
    @IBOutlet weak var namaUser: UILabel!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        namaUser.text = DataManager.shared.nameUser
    }

    @IBAction func switchChangeState(_ sender: Any) {
        if switchReminder.isOn{
            timePickButton.isEnabled = true
            setNotification()
        }
        else{
            timePickButton.isEnabled = false
        }
    }
    
    @IBAction func timeButtonTapped(_ sender: Any) {
        
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .bordered, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .bordered, target: self, action:  #selector(cancelDatePicker))
        
        toolbar.setItems([doneButton,spaceButton,  cancelButton], animated: false)
        
        timePicker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        view.addSubview(timePicker)
        
    }
    @objc func doneDatePicker(){
        
    }
    
    @objc func cancelDatePicker(){
    
    }
    
    
    func setNotification(){
        print("This is code for push notifications")
    }
    
}

extension MeViewController{
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension MeViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else {
            return 60
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02d", row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            let hours = row
            print("hours: \(hours)")
        }else{
            let minute = row
            print("second: \(minute)")
        }
    }
    

    
    
    
}
