//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//
import Charts
import UIKit

class BarChartViewController: UIViewController , ChartViewDelegate{

    @IBOutlet weak var barChartView: BarChartView!
    
    
    var months: [String]!	
    @IBAction func saveChart(sender: UIBarButtonItem) {
        barChartView.saveToCameraRoll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 8.0]
        
        setChart( _ : months, values: unitsSold)
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        print("\(entry.value) in \(months[entry.xIndex])")
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        chartDataSet.colors = [UIColor(red: CGFloat(Double(arc4random_uniform(256)/255)), green: CGFloat(Double(arc4random_uniform(256)/255)), blue: CGFloat(Double(arc4random_uniform(256))/255), alpha: 1)]
        chartDataSet.colors = ChartColorTemplates.colorful()
        barChartView.data = chartData
        barChartView.xAxis.labelPosition = .BothSided
        barChartView.xAxis.labelTextColor = UIColor(red: 102/255, green: 51/255, blue: 0/255, alpha: 1)
        barChartView.descriptionText = ""
        
        barChartView.backgroundColor = UIColor(red: 128/255, green: 229/255, blue: 255/255, alpha: 1)
//        barChartView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//        barChartView.descriptionTextColor = UIColor(red: 255/255, green: 102/255, blue: 204/255, alpha: 1)

//        barChartView.backgroundColor = UIColor(red: CGFloat(Double(arc4random_uniform(255)/255)), green: CGFloat(Double(arc4random_uniform(255)/255)), blue: CGFloat(Double(arc4random_uniform(255))/255), alpha: 1)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInOutQuad)
        let ll = ChartLimitLine(limit: 10.0, label: "Target")
        barChartView.rightAxis.addLimitLine(ll)
        
    }


}

