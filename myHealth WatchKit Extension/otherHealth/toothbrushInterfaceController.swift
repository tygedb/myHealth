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


class toothbrushInterfaceController: WKInterfaceController, WKExtendedRuntimeSessionDelegate {
 
    var timer = Timer()
    var timeLeft = 120
    var startTime = TimeInterval()
    var endTime = Date()
    var alarmTime = Date()
    let toothbrush = HKQuantityType.categoryType(forIdentifier: .toothbrushingEvent)
    let healthStore = HKHealthStore()
    var backGroundTask = WKApplicationRefreshBackgroundTask()
    var session = WKExtendedRuntimeSession()
    var extendedRunTimeTimer: DispatchSourceTimer? = nil
    var sample: HKQuantitySample? = nil
    @IBOutlet weak var timeLabel: WKInterfaceLabel!
    @IBOutlet weak var startButton: WKInterfaceButton!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        session.delegate = self
        session = WKExtendedRuntimeSession()
        startButton.setTitle("Start")
        
        func activateHealthKit() {
        let typesToRead = Set([
        
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
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start(at: Date())
        let fireDate = Date(timeIntervalSinceNow: 10)
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
    let toothbrushQuantityType = HKCategoryType.categoryType(forIdentifier: .toothbrushingEvent)
    let timeLeftAmount = Int(120)
    let now = Date()
    let startDate = now.addingTimeInterval(-60)
    let endDate = now
    let unit = HKUnit.minute()
    var sample: HKCategorySample? = nil
    timeLeft -= 1
    timeLabel.setText("\(timeString(time: TimeInterval(timeLeft)))")

    if timeLeft <= 0 {
        WKInterfaceDevice.current().play(.stop)
        timer.invalidate()
        timeLabel.setText("\(timeString(time: TimeInterval(timeLeft)))")
//        if let toothBrushQuantityType = toothbrushQuantityType {
//            sample = HKCategorySample(type: toothBrushQuantityType, value: timeLeftAmount, start: startDate, end: endDate)
//
//        }
//        healthStore.save(sample!) { (success, error) in
//            DispatchQueue.main.async {
//                return
//            }
//        }
    }
  
}
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        print("Session stopped at \(Date())")
        
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
    print("Session started at\(Date())")
        extendedRunTimeTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(), queue: DispatchQueue.main)
        let workItem = DispatchWorkItem(qos: .default) {
            print("Timer: \(String(describing: self.start))")
        }
        extendedRunTimeTimer?.setEventHandler(handler: workItem)
        extendedRunTimeTimer?.resume()
        
        
    }
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        
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
