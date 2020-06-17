//
//  SymptomsInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/11/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit
class SymptomsInterfaceController: WKInterfaceController {

    let healthStore = HKHealthStore()
        
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
          
        if #available(iOS 13.6, *) {
        
                  } else {
                  
                  }
           func activateHealthKit() {
                let typesToShare: Set = [
           
                      HKQuantityType.quantityType(forIdentifier: .heartRate)!,
        

               ]
               
               // The quantity types to read from the health store.
               let typesToRead: Set = [
                   HKQuantityType.quantityType(forIdentifier: .heartRate)!,
                   HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
                   HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                   
                 
               ]
            healthStore.requestAuthorization(toShare: (typesToShare as Set<HKSampleType>), read: (typesToRead as Set<HKObjectType>)) { (success, error) -> Void in
           }
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
