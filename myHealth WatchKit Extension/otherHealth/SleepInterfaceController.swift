//
//  SleepInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/31/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class SleepInterfaceController: WKInterfaceController, WKExtendedRuntimeSessionDelegate {
    
    @IBOutlet weak var displayTimeLabel: WKInterfaceLabel!
    @IBOutlet weak var batteryLife: WKInterfaceLabel!
    @IBOutlet weak var stopButton: WKInterfaceButton!
    @IBOutlet weak var playButton: WKInterfaceButton!
    
    let healthStore = HKHealthStore()
    var startTime = TimeInterval()
    var endTime = Date()
    var alarmTime = Date()
    var timer = Timer()
    var session = WKExtendedRuntimeSession()
    var time = 15
    var expirationDate = Date()
    var extendedRunTimeTimer: DispatchSourceTimer? = nil
   
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        session.delegate = self
        session = WKExtendedRuntimeSession()
        stopButton.setAlpha(0)
        WKInterfaceDevice.current().isBatteryMonitoringEnabled = true
//        batteryLife.setText("\(WKInterfaceDevice.current().batteryLevel.binade)%")
//        batteryLife.setTextColor(.red)
        let typesToRead = Set([HKObjectType.categoryType(forIdentifier: .sleepAnalysis)])
        
        let typesToWrite = Set([HKObjectType.categoryType(forIdentifier: .sleepAnalysis)])
        
        
        self.healthStore.requestAuthorization(toShare: (typesToRead as! Set<HKSampleType>), read: (typesToWrite as! Set<HKObjectType>)) { (success, error) -> Void in
            
            if success == false {
                
                NSLog("Display not Allowed.")
            }
            
        }
        
    }
    
    @IBAction func start(sender: AnyObject) {
        session = WKExtendedRuntimeSession()
        playButton.setAlpha(0)
        stopButton.setAlpha(1)
        session.delegate = self
        session.start(at: Date())
        WKInterfaceDevice.current().play(.start)
        let fireDate = Date(timeIntervalSinceNow: 20)
        alarmTime = Date()
        if (!timer.isValid) {
            let aSelector : Selector = #selector(SleepInterfaceController.updateTimer)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = Date.timeIntervalSinceReferenceDate
        }
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: fireDate, userInfo: nil) { (error) in
            if (error == nil) {
                print("SUCCESS")
                
            }
            
            
        }
        
    }
    @IBAction func stop(sender: AnyObject){
        session.invalidate()
        playButton.setAlpha(1)
        stopButton.setAlpha(0)
        WKInterfaceDevice.current().play(.stop)
               endTime = Date()
               self.saveSleepAnalysis()
               self.retreiveSleepAnalysis()
               timer.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
           
            self.dismiss()
        }
               
           }
    
    @objc func updateTimer() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        
        var elapsedTime: TimeInterval = currentTime - startTime
        
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        
//        let fraction = UInt8(elapsedTime * 100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
//        let strFractions = String(format: "%02d", fraction)
        
        
        displayTimeLabel.setText("\(strMinutes):\(strSeconds)")
    }

    func saveSleepAnalysis() {
        
        if let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) {
            
            let object = HKCategorySample(type: sleepType, value: HKCategoryValueSleepAnalysis.inBed.rawValue, start: self.alarmTime, end: self.endTime)
            
            
            healthStore.save(object, withCompletion: { (success, error)-> Void in
                
                if error != nil {
                              
                              return
                          }
                          
                          if success {
                              print("New sleep data saved in Health")
                          } else {
                }

                
            })
            
            let object2 = HKCategorySample(type: sleepType, value: HKCategoryValueSleepAnalysis.asleep.rawValue, start: self.alarmTime, end: self.endTime)
                
            healthStore.save(object2, withCompletion: { (success, error)-> Void in
                        
                        if error != nil {
                                      
                                      return
                                  }
                                  
                                  if success {
                                      print("New sleep data 2 saved in Health")
                                  } else {
                                    
                        }

                    })
        }
        
        
    }
    
    func retreiveSleepAnalysis() {
        
        
        if let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) {
            
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    
                    return
                }
              
                if let result = tmpResult {
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                            
                            print("Sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                            
                        }
                    }
                }
                
            }
            
            healthStore.execute(query)
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
