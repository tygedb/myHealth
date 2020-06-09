//
//  FoodInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/3/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit
import UIKit

class FoodInterfaceController: WKInterfaceController {

    @IBOutlet weak var caloriesTextField: WKInterfaceLabel!
    @IBOutlet weak var proteinTextField: WKInterfaceTextField!
    @IBOutlet weak var totalfatTextField: WKInterfaceTextField!
    @IBOutlet weak var sugarTextField: WKInterfaceTextField!
    let healthStore = HKHealthStore()
//    let carbAmount: Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let typesToWrite: Set = [
 
            HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates),
            HKObjectType.quantityType(forIdentifier: .dietaryFatTotal),
            HKObjectType.quantityType(forIdentifier: .dietaryProtein),
            HKObjectType.quantityType(forIdentifier: .dietarySugar),
            HKObjectType.quantityType(forIdentifier: .dietaryFiber),
            HKObjectType.quantityType(forIdentifier: .dietaryCalcium),
            HKObjectType.quantityType(forIdentifier: .dietaryIron)
        
        ]
        
        let typesToRead: Set = [
            HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates),
                      HKObjectType.quantityType(forIdentifier: .dietaryFatTotal),
                      HKObjectType.quantityType(forIdentifier: .dietaryProtein),
                      HKObjectType.quantityType(forIdentifier: .dietarySugar),
                      HKObjectType.quantityType(forIdentifier: .dietaryFiber),
                      HKObjectType.quantityType(forIdentifier: .dietaryCalcium),
                      HKObjectType.quantityType(forIdentifier: .dietaryIron)
       ]
        healthStore.requestAuthorization(toShare: (typesToWrite as! Set<HKSampleType>), read: (typesToRead as! Set<HKObjectType>)) { (success, error) in
        }
        
        
    }
    
    @IBAction func addAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
        return
   }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let carbQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCarbohydrates)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let carbQuantityType = carbQuantityType {
        sample = HKQuantitySample(type: carbQuantityType, quantity: quantityType, start: startDate, end: endDate)
    }
        healthStore.save(sample!) { (sucess, error) in
            DispatchQueue.main.async {
                print(quantityType)
            print(sucess)
            return
        }
 
    }
}
    @IBAction func proteinAction(_ value: NSString?) {
         WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let proteinQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryProtein)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        
        var sample: HKQuantitySample? = nil
        if let proteinQuantityType = proteinQuantityType {
            sample = HKQuantitySample(type: proteinQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                print(success)
                
                return
            }
        }
        
    }
    @IBAction func fatAction(_ value: NSString?) {
         WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let fatQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endeDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let fatQuantityType = fatQuantityType {
            sample = HKQuantitySample(type: fatQuantityType, quantity: quantityType, start: startDate, end: endeDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                print(success)
                return
            }
        }
 
    }
    @IBAction func sugarAction(_ value: NSString?) {
         WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let sugarQuantityType = HKQuantityType.quantityType(forIdentifier: .dietarySugar)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let sugarQuantityType = sugarQuantityType {
            sample = HKQuantitySample(type: sugarQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            print(success)
            return
        }
    }
    
    @IBAction func fiberAction(_ value: NSString?) {
         WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let fiberQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryFiber)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let fiberQuantityType = fiberQuantityType {
        sample = HKQuantitySample(type: fiberQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                print(success)
                return
            }
        }
    }
    
    @IBAction func calciumAction(_ value: NSString?) {
         WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let calciumQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCalcium)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let calciumQuantityType = calciumQuantityType {
        sample = HKQuantitySample(type: calciumQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                print(success)
                return
            }
        }
    }
    @IBAction func ironAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let ironQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryIron)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        
        var sample: HKQuantitySample? = nil
        if let ironQuantityType = ironQuantityType {
            sample = HKQuantitySample(type: ironQuantityType, quantity: quantityType, start: startDate, end: endDate)  
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                print(success)
                return
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
