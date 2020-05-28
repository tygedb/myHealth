//
//  StrengthInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/26/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class StrengthInterfaceController: WKInterfaceController {

    let healthStore = HKHealthStore()
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let typestoShare: Set = [
                            HKQuantityType.workoutType()
                        ]
                        
                        let typesToRead: Set = [
                            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
                            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
                            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
                        ]
               healthStore.requestAuthorization(toShare: typestoShare, read: typesToRead) { (success, error) in
                   // Handle error. No error handling in this sample project.
               }
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func rowingAction() {
    }
    @IBAction func ellipticalAction() {
    }
    @IBAction func stairStepperAction() {
    }
}
