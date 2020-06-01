//
//  HealthKitManager.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/28/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class HealthKitManager: WKInterfaceController {

    let healthKitStore: HKHealthStore = HKHealthStore()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    func authorizeHealthKit(completion: ((_ success: Bool, _ error: NSError?) -> Void)!) {
        
        let healthDataToRead = Set(arrayLiteral: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning))
        
        let healthDataToWrite = Set(arrayLiteral: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning))
        
        
        healthKitStore.requestAuthorization(toShare: healthDataToWrite as? Set<HKSampleType>, read: healthDataToRead as? Set<HKObjectType>) { (success, error) in
                   // Handle error. No error handling in this sample project.
               }
    }
    
    func saveDistance(distanceRecored: Double, date: NSDate) {
        let distanceType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        
        let distanceQuantity = HKQuantity(unit: HKUnit.mile(), doubleValue: distanceRecored)
        
        let distance = HKQuantitySample(type: distanceType, quantity: distanceQuantity, start: date as Date, end: date as Date)
        
        healthKitStore.save(distance, withCompletion: { (success, error) -> Void in
            if(error != nil) {
                print(error!)
            } else {
                print("Distance has been recored")
            }
            
        })
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
