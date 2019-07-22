//
//  BarStoryBoard.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 12/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var numbers = Array<Double>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Bar Chart Appear")
        
        numbers = [0, 1, 2, 3, 4, 2, 3, 4, 0, 1, 2]
        
//        updateData()
    }
    @IBAction func segmentedCOntrol(_ sender: Any) {
        
//        if sender.
        
    }
    
    func updateData(){
        
        var barChartEntry = [BarChartDataEntry]()
        
        for i in 0 ..< numbers.count {
            
            //set X n Y status in data entry -> X is index, Y is number of feels
            let value = BarChartDataEntry(x: Double(i), y: numbers[i])
            
            //add to data entry
            barChartEntry.append(value)
        }
        
        //convert data entry to data set
        let line = BarChartDataSet(entries: barChartEntry, label: "Feels")
        
        //set color of data shown
        line.colors = [UIColor.red]
        
        //object of data that will be shown
        let data = BarChartData()
        
        //add data to object data
        data.addDataSet(line)
        
        //show the data on view
        barChartView.data = data
        
        //show the chart description
        barChartView.chartDescription?.text = "This is My Data"
        
    }
    
}
