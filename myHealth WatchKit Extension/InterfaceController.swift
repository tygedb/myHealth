//
//  InterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/21/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit
import CoreLocation
import UserNotifications
import Intents

class InterfaceController: WKInterfaceController {
    
  
    let healthStore = HKHealthStore()
    @IBOutlet weak var pickerVIew: WKInterfacePicker!
    let workoutView = WorkoutSessionView()
    var items: [String]! = nil
//    override func willActivate() {
//
//        items = (1...5).map {"menu\($0).png"}
//        let pickerItems: [WKPickerItem] = items.map {
//            let pickerItem = WKPickerItem()
//            pickerItem.contentImage = WKImage(imageName: $0)
//            return pickerItem
//        }
//        pickerVIew.setItems(pickerItems)
//    }
  
    override func didAppear() {
        super.didAppear()
        
       
        /// Requesting authorization.
        /// - Tag: RequestAuthorization
        // The quantity type to write to the health store.
        let typesToShare: Set = [
            HKQuantityType.workoutType()
          
        ]
        
        // The quantity types to read from the health store.
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            
          
        ]
        
        
        
        
        
        // Request authorization for those quantity types.
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            // Handle error. No error handling in this sample project.
        }
    }
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if segueIdentifier == "walking" {
            WKInterfaceDevice.current().play(.start)
            /// - Tag: WorkoutConfiguration
            let configuration = HKWorkoutConfiguration()
            configuration.activityType = .walking
            configuration.locationType = .outdoor
            
            return WorkoutSessionContext(healthStore: healthStore, configuration: configuration)
   }
        if segueIdentifier == "running" {
            /// - Tag: WorkoutConfiguration
           WKInterfaceDevice.current().play(.start)
            let configuration = HKWorkoutConfiguration()
            configuration.activityType = .running
            configuration.locationType = .outdoor

            return WorkoutSessionContext(healthStore: healthStore, configuration: configuration)
        }

        if segueIdentifier == "elliptical" {
            WKInterfaceDevice.current().play(.start)
           let configuration = HKWorkoutConfiguration()
           configuration.activityType = .elliptical
           configuration.locationType = .indoor

            return ellipticalSessionContext(healthStore: healthStore, configuration: configuration)
        }

        if segueIdentifier == "yoga" {
            WKInterfaceDevice.current().play(.start)
            let configuration = HKWorkoutConfiguration()
            configuration.activityType = .yoga
            configuration.locationType = .indoor

            return yogaSessionContext(healthStore: healthStore, configuration: configuration)
        }
        
      

        return nil
    }
    @IBAction func pickerAction(_ value: Int) {
//        func setItems(_ items: [WKPickerItem]) {
//            if items == 0 {
//            WKInterfaceDevice.current().play(.start)
//             let configuration = HKWorkoutConfiguration()
//             configuration.activityType = .running
//             configuration.locationType = .outdoor
//            }
//             
//        }
    }
    
    //MARK: Haptic Actions
    @IBAction func nutritionAction() {
        WKInterfaceDevice.current().play(.click)
        self.presentController(withNames: ["Nutrition", "NutritionTwo", "NutritionThree"], contexts: nil)

    }
    @IBAction func MentalHealth() {
        WKInterfaceDevice.current().play(.click)
        self.presentController(withNames: ["Mental", "Sleep", "Mood"], contexts: nil)
    }
    
  
    @IBAction func toothbrush() {
        WKInterfaceDevice.current().play(.click)
        self.presentController(withName: "toothbrush", context: nil)
    }
    @IBAction func symptomAction() {
        if #available(watchOS 7.0, *) {
            WKInterfaceDevice.current().play(.click)
            self.presentController(withName: "symptoms", context: nil)
        } else {
            self.presentController(withName: "updateOS", context: nil)
        }
        
    }
    
    
}
    

