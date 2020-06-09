//
//  ellipticalSessionContext.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/7/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit
class ellipticalSessionContext {
   
    let configuration: HKWorkoutConfiguration
        let healthStore: HKHealthStore
        
        init(healthStore: HKHealthStore, configuration: HKWorkoutConfiguration) {
            self.healthStore = healthStore
            self.configuration = configuration
        }
}
