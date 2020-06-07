//
//  WorkOutSessionContext.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/25/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import Foundation
import HealthKit
//import Alamofire
class WorkoutSessionContext {
    
    let configuration: HKWorkoutConfiguration
    let healthStore: HKHealthStore
    
    init(healthStore: HKHealthStore, configuration: HKWorkoutConfiguration) {
        self.healthStore = healthStore
        self.configuration = configuration
    }
    
    
    
}
