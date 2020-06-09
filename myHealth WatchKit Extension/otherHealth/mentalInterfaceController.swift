//
//  mentalInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/26/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class mentalInterfaceController: WKInterfaceController {
    let healthStore = HKHealthStore()
    var timer = Timer()
    var intCounter: Int = 0
    var timeLeft = 120

    @IBOutlet weak var timeLabel: WKInterfaceLabel!
    @IBOutlet weak var heartRateLabel: WKInterfaceLabel!
    
    @IBOutlet weak var meditationMinutesLabel: WKInterfaceLabel!
    let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession)
    var minutes: Int = 0

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.activateHealthKit()
        timeLabel.setText("00:00")
        meditationMinutesLabel.setText("\(minutes)")
        // Configure interface objects here.
    }
   
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to use
        super.willActivate()
    }

    override func didDeactivate() {
        let fireDate = Date(timeIntervalSinceNow: 10)
        
             WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: fireDate, userInfo: nil) { (error) in
                        if (error == nil) {
                            print("SUCCESS")
                        }
                        
                        
                    }
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
//MARK: HealthKit Activation
    func activateHealthKit() {
        let typesToRead = Set([
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.mindfulSession)!
        ])
        
        let typesToWrite = Set([
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.mindfulSession)!
            
        ])
        
        self.healthStore.requestAuthorization(toShare: typesToWrite, read: typesToRead) { (success, error) -> Void in
            
            if !success {
                print("Healkit Auth error\(String(describing: error))")
            }
            
            self.retreiveMindfulMinutes()
            
        }
        
    }
//    MARK: Receive Mindful Minutes
    func retreiveMindfulMinutes() {
        
        let sortDescriptor = NSSortDescriptor( key: HKSampleSortIdentifierEndDate, ascending: false)
        
        
        let endDate = Date()
        let startDate = endDate.addingTimeInterval(-1.0 * 60.0 * 60.0 * 24.0)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        
        
        let query = HKSampleQuery(sampleType: mindfulType!, predicate: predicate, limit: 0, sortDescriptors: [sortDescriptor], resultsHandler: updateMeditationTime)
        
        healthStore.execute(query)
        
    }
    
    
    func calculatedTotalTime(sample: HKSample) -> TimeInterval {
        let totalTime = sample.endDate.timeIntervalSince(sample.startDate)
        let wasUserEntered = sample.metadata?[HKMetadataKeyWasUserEntered] as? Bool ?? false
         print("\nHealthkit mindful entry: \(sample.startDate) \(sample.endDate) - value: \(totalTime) quantity: \(totalTime) user entered: \(wasUserEntered)\n")
        return totalTime
    }
    func updateMeditationTime(query: HKSampleQuery, results: [HKSample]?, error: Error?) {
               if error != nil {return}
               
               let totalMeditationTime = results?.map(calculatedTotalTime).reduce(0, { $0 + $1}) ?? 0
               
               print("Total: \(totalMeditationTime)")
               
               renderMeditationMinuteText(totalMeditationSeconds: totalMeditationTime)
           }
           func renderMeditationMinuteText(totalMeditationSeconds: Double) {
                  
                  let minutes = Int(totalMeditationSeconds / 60)
                  let labelText = "\(minutes) minutes total"
                  self.meditationMinutesLabel.setText(labelText)
                  
                  
              }
    
   
    @IBAction func startBreathe() {
      
        WKInterfaceDevice.current().play(.start)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
       
    }
    
    @IBAction func stopBreathe() {
        WKInterfaceDevice.current().play(.stop)
        let startTime = Date()
        let endTime = startTime.addingTimeInterval(1.0 * 60.0)
        self.saveMindfullAnalysis(startTime: startTime, endTime: endTime)
        timer.invalidate()
        timeLabel.setText("00:00")

        //Update timer
       
    }
    
    @objc func onTimerFires() {
        intCounter += 1
        timeLabel.setText(String(format:"%02d:%02d", (intCounter % 3600) / 60, (intCounter % 3600) % 60))
           
        if timeLeft >= 60 {
//            WKInterfaceDevice.current().play(.stop)
//                   let startTime = Date()
//                   let endTime = startTime.addingTimeInterval(1.0 * 60.0)
//                   self.saveMindfullAnalysis(startTime: startTime, endTime: endTime)
//                    timer.invalidate()
//                   timeLabel.setText("00:00")
                  
        }

       }
    
    func saveMindfullAnalysis(startTime: Date, endTime: Date) {
      
        let mindfullSample = HKCategorySample(type: mindfulType!, value: 0, start: startTime, end: endTime)
        
         
        
        healthStore.save(mindfullSample, withCompletion: {(success, error) -> Void in
            print("New data was saved in HealthKit: \(success)")
            self.retreiveMindfulMinutes()
            
        })
        
       
        
    }
    
}
