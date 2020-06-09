//
//  WaterInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/26/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit


class WaterInterfaceController: WKInterfaceController {
    var i = 0
    let healthStore = HKHealthStore()
    static let shared = WaterInterfaceController()
    let water = HKObjectType.quantityType(forIdentifier: .dietaryWater)

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.activateHealthKit()
        // Configure interface objects here.
    }
    
    func activateHealthKit() {
        let typesToRead = Set([
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryWater)!
        
        ])
        
        let typesToShare = Set ([
        
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryWater)!
        
        ])
        
        self.healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) -> Void in
            
            if !success {
                print("HealthKit Auth Error\(String(describing: error))")
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
    //MARK: Water Tracker
    @IBAction func eightOzButton() {
        WKInterfaceDevice.current().play(.success)
        let waterQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryWater)
        let waterAmount = Int(8.0)
        let unit = HKUnit.fluidOunceUS()
         let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
       
        let quantity = HKQuantity(unit: unit, doubleValue: Double(waterAmount))
      
        var sample: HKQuantitySample? = nil
        if let waterQuantityType = waterQuantityType {
            sample = HKQuantitySample(type: waterQuantityType, quantity: quantity, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
            
            
        }
    }
    @IBAction func twelveOzButton() {
        WKInterfaceDevice.current().play(.success)
        let waterQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryWater)
               let waterAmount = Int(12.0)
               let unit = HKUnit.fluidOunceUS()
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(waterAmount))
             
               var sample: HKQuantitySample? = nil
               if let waterQuantityType = waterQuantityType {
                   sample = HKQuantitySample(type: waterQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func eightteenOzButton() {
        WKInterfaceDevice.current().play(.success)
        let waterQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryWater)
               let waterAmount = Int(18.0)
               let unit = HKUnit.fluidOunceUS()
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(waterAmount))
             
               var sample: HKQuantitySample? = nil
               if let waterQuantityType = waterQuantityType {
                   sample = HKQuantitySample(type: waterQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func twentytwoOzButton() {
        WKInterfaceDevice.current().play(.success)
        let waterQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryWater)
               let waterAmount = Int(20.0)
               let unit = HKUnit.fluidOunceUS()
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(waterAmount))
             
               var sample: HKQuantitySample? = nil
               if let waterQuantityType = waterQuantityType {
                   sample = HKQuantitySample(type: waterQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func thirthytwoOzButton() {
        WKInterfaceDevice.current().play(.success)
        let waterQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryWater)
               let waterAmount = Int(32.0)
               let unit = HKUnit.fluidOunceUS()
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(waterAmount))
             
               var sample: HKQuantitySample? = nil
               if let waterQuantityType = waterQuantityType {
                   sample = HKQuantitySample(type: waterQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func fortyOzButton() {
        WKInterfaceDevice.current().play(.success)
        let waterQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryWater)
               let waterAmount = Int(40.0)
               let unit = HKUnit.fluidOunceUS()
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(waterAmount))
             
               var sample: HKQuantitySample? = nil
               if let waterQuantityType = waterQuantityType {
                   sample = HKQuantitySample(type: waterQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
        }
}
