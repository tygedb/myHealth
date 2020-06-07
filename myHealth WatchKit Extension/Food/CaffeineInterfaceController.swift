//
//  CaffeineInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/5/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class CaffeineInterfaceController: WKInterfaceController {

    let healthStore = HKHealthStore()
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
         
        self.activateHealthKit()
        
        
       
    }
    func activateHealthKit() {
                  let typesToRead = Set([
                      HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCaffeine)!
                  
                  ])
                  
                  let typesToShare = Set ([
                  
                      HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.dietaryCaffeine)!
                  
                  ])
                  
                  self.healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) -> Void in
                      
                      if !success {
                          print("HealthKit Auth Error\(String(describing: error))")
                      }

                  }
              }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func eightOzAction() {
        WKInterfaceDevice.current().play(.success)
                        let caffeineQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCaffeine)
                        let caffeineAmount = Int(8)
        let unit = HKUnit.gramUnit(with: HKMetricPrefix.milli)
                       let now = Date()
                      let startDate = now.addingTimeInterval(-60)
                      let endDate = now
                     
                      let quantity = HKQuantity(unit: unit, doubleValue: Double(caffeineAmount))
                    
                      var sample: HKQuantitySample? = nil
                      if let caffeineQuantityType = caffeineQuantityType {
                          sample = HKQuantitySample(type: caffeineQuantityType, quantity: quantity, start: startDate, end: endDate)
                      }
                      healthStore.save(sample!) { (success, error) in
                          DispatchQueue.main.async {
                              return
                          }
                          
                          
                      }
        
    }
    @IBAction func twelveOzAction() {
        WKInterfaceDevice.current().play(.success)
        let caffeineQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCaffeine)
               let caffeineAmount = Int(12.0)
               let unit = HKUnit.gramUnit(with: HKMetricPrefix.milli)
               let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(caffeineAmount))
             
               var sample: HKQuantitySample? = nil
               if let caffeineQuantityType = caffeineQuantityType {
                   sample = HKQuantitySample(type: caffeineQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func OzAction() {
        WKInterfaceDevice.current().play(.success)
        let caffeineQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCaffeine)
               let caffeineAmount = Int(18.0)
               let unit = HKUnit.gramUnit(with: HKMetricPrefix.milli)
               let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(caffeineAmount))
             
               var sample: HKQuantitySample? = nil
               if let caffeineQuantityType = caffeineQuantityType {
                   sample = HKQuantitySample(type: caffeineQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func twentytwoOzAction() {
        WKInterfaceDevice.current().play(.success)
                let caffeineQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCaffeine)
               let caffeineAmount = Int(22.0)
                let unit = HKUnit.gramUnit(with: HKMetricPrefix.milli)
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(caffeineAmount))
             
               var sample: HKQuantitySample? = nil
               if let caffeineQuantityType = caffeineQuantityType {
                   sample = HKQuantitySample(type: caffeineQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func thirtytwoOzAction() {
        WKInterfaceDevice.current().play(.success)
        let caffeineQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCaffeine)
               let caffeineAmount = Int(32.0)
               let unit = HKUnit.gramUnit(with: HKMetricPrefix.milli)
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(caffeineAmount))
             
               var sample: HKQuantitySample? = nil
               if let caffeineQuantityType = caffeineQuantityType {
                   sample = HKQuantitySample(type: caffeineQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
    @IBAction func fortyOzAction() {
        WKInterfaceDevice.current().play(.success)
        let caffeineQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCaffeine)
               let caffeineAmount = Int(40.0)
               let unit = HKUnit.gramUnit(with: HKMetricPrefix.milli)
                let now = Date()
               let startDate = now.addingTimeInterval(-60)
               let endDate = now
              
               let quantity = HKQuantity(unit: unit, doubleValue: Double(caffeineAmount))
             
               var sample: HKQuantitySample? = nil
               if let caffeineQuantityType = caffeineQuantityType {
                   sample = HKQuantitySample(type: caffeineQuantityType, quantity: quantity, start: startDate, end: endDate)
               }
               healthStore.save(sample!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
                   
                   
               }
    }
}
