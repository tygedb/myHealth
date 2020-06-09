//
//  toothbrushInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/6/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit


class toothbrushInterfaceController: WKInterfaceController {
    
    var timer = Timer()
    var timeLeft = 120
    var startTime = TimeInterval()
    var endTime = Date()
    var alarmTime = Date()
    let toothbrush = HKQuantityType.categoryType(forIdentifier: .toothbrushingEvent)
    let healthStore = HKHealthStore()
    var backGroundTask = WKApplicationRefreshBackgroundTask()
    @IBOutlet weak var timeLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        func activateHealthKit() {
        let typesToRead = Set ([
        
            HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)
        
        ])
            let typesToWrite = Set ([
                
                HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)
            
            ])
            healthStore.requestAuthorization(toShare: (typesToWrite as! Set<HKSampleType>), read: (typesToRead as! Set<HKObjectType>)) { (success, error) -> Void in
                
                
                
            }
        
        }
        

        
        
        // Configure interface objects here.
    }
    
    @IBAction func start() {
        WKInterfaceDevice.current().play(.start)
        let fireDate = Date(timeIntervalSinceNow: 10)
//        let tBrushQuantityType = HKCategoryType.categoryType(forIdentifier: .toothbrushingEvent)
//        let tbAmount = 2
//        let unit = HKUnit.minute()
//        let now = Date()
//        let startDate = now.addingTimeInterval(-60)
//        let endDate = now
        
//        let quantity = HKQuantity(unit: unit, doubleValue: Double(tbAmount))
//        var sample = HKCategoryValue(quantity)
//
//
//        if let tbrushQuantityType = tBrushQuantityType {
//            sample = HKCategorySample(type: tbrushQuantityType, value: 2, start: startDate, end: endDate)
//        }
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
       
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: fireDate, userInfo: nil) { (error) in
            if (error == nil) {
                print("SUCCESS")
            }
            
            
        }
        
    }
    func timeString(time: TimeInterval) -> String {
             let minute = Int(time) / 60 % 60
             let second = Int(time) % 60

             // return formated string
             return String(format: "%02i:%02i", minute, second)
         }
    
@objc func onTimerFires()
{
    timeLeft -= 1
    timeLabel.setText("\(timeString(time: TimeInterval(timeLeft)))")

    if timeLeft <= 0 {
        WKInterfaceDevice.current().play(.stop)
        timer.invalidate()
    }
  
}
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
       
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }


}