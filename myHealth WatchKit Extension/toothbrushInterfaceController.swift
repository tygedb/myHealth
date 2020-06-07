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
    let healthStore = HKHealthStore()
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
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
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

    
  func scheduleBackgroundRefresh(withPreferredDate preferredFireDate: Date, userInfo: (NSSecureCoding & NSObjectProtocol)?,scheduledCompletion: @escaping (Error?) -> Void) {
    
    }
}
