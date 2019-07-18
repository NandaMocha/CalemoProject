//
//  ViewController.swift
//  CalemoProject
//
//  Created by Nanda Mochammad on 12/07/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController {

    @IBOutlet weak var barChartView: LineChartView!
    
    var numbers = [Double]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Show the chart")
        
        numbers = [0, 1, 2, 3, 4, 2, 3, 4, 0, 1, 2]
        
        updateGraph()
    }
    
    func updateGraph() {
        
        var lineChartEntry = [ChartDataEntry]()
        
        for i in 0 ..< numbers.count {
            
            //set X n Y status in data entry -> X is index, Y is number of feels
            let value = ChartDataEntry(x: Double(i), y: numbers[i])
            
            //add to data entry
            lineChartEntry.append(value)
        }
        
        //convert data entry to data set
        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Feels")
        
        //set color of data shown
        
        line1.colors = [UIColor.blue]
        
        //object of data that will be shown
        let data = LineChartData()
        
        //add data to object data
        data.addDataSet(line1)
        
        //show the data on view
        barChartView.data = data
        
        //show the chart description
        barChartView.chartDescription?.text = "This is My Data"
        
    }


}
