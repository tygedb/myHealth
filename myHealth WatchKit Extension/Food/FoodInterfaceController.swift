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
            HKObjectType.quantityType(forIdentifier: .dietaryIron),
            
            HKObjectType.quantityType(forIdentifier: .dietaryCopper),
            HKObjectType.quantityType(forIdentifier: .dietaryFolate),
            HKObjectType.quantityType(forIdentifier: .dietaryNiacin),
            HKObjectType.quantityType(forIdentifier: .dietaryPotassium),
            HKObjectType.quantityType(forIdentifier: .dietaryRiboflavin),
            HKObjectType.quantityType(forIdentifier: .dietaryThiamin),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminA),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminC),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminB6),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminB12),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminD),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminE),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminK),
            HKObjectType.quantityType(forIdentifier: .dietaryCholesterol),
            HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed),
            HKObjectType.quantityType(forIdentifier: .dietaryFatSaturated),
            HKObjectType.quantityType(forIdentifier: .dietaryFatMonounsaturated),
            HKObjectType.quantityType(forIdentifier: .dietaryFatPolyunsaturated),
            HKObjectType.quantityType(forIdentifier: .dietaryBiotin),
            HKObjectType.quantityType(forIdentifier: .dietaryChloride),
            HKObjectType.quantityType(forIdentifier: .dietaryChromium),
            HKObjectType.quantityType(forIdentifier: .dietaryIodine),
            HKObjectType.quantityType(forIdentifier: .dietaryMagnesium),
            HKObjectType.quantityType(forIdentifier: .dietaryManganese),
            HKObjectType.quantityType(forIdentifier: .dietaryMolybdenum),
            HKObjectType.quantityType(forIdentifier: .dietaryPantothenicAcid),
            HKObjectType.quantityType(forIdentifier: .dietaryPhosphorus),
            HKObjectType.quantityType(forIdentifier: .dietarySelenium),
            HKObjectType.quantityType(forIdentifier: .dietaryZinc)
        ]
        
        let typesToRead: Set = [
            HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates),
            HKObjectType.quantityType(forIdentifier: .dietaryFatTotal),
            HKObjectType.quantityType(forIdentifier: .dietaryProtein),
            HKObjectType.quantityType(forIdentifier: .dietarySugar),
            HKObjectType.quantityType(forIdentifier: .dietaryFiber),
            HKObjectType.quantityType(forIdentifier: .dietaryCalcium),
            HKObjectType.quantityType(forIdentifier: .dietaryIron),
            HKObjectType.quantityType(forIdentifier: .dietaryBiotin),
            HKObjectType.quantityType(forIdentifier: .dietaryCopper),
            
            HKObjectType.quantityType(forIdentifier: .dietaryFolate),
            HKObjectType.quantityType(forIdentifier: .dietaryNiacin),
            HKObjectType.quantityType(forIdentifier: .dietaryPotassium),
            HKObjectType.quantityType(forIdentifier: .dietaryRiboflavin),
            HKObjectType.quantityType(forIdentifier: .dietaryThiamin),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminA),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminC),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminB6),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminB12),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminD),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminE),
            HKObjectType.quantityType(forIdentifier: .dietaryVitaminK),
            HKObjectType.quantityType(forIdentifier: .dietaryCholesterol),
            HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed),
            HKObjectType.quantityType(forIdentifier: .dietaryFatSaturated),
            HKObjectType.quantityType(forIdentifier: .dietaryFatMonounsaturated),
            HKObjectType.quantityType(forIdentifier: .dietaryFatPolyunsaturated),
            HKObjectType.quantityType(forIdentifier: .dietaryChloride),
            HKObjectType.quantityType(forIdentifier: .dietaryChromium),
            HKObjectType.quantityType(forIdentifier: .dietaryIodine),
            HKObjectType.quantityType(forIdentifier: .dietaryMagnesium),
            HKObjectType.quantityType(forIdentifier: .dietaryManganese),
            HKObjectType.quantityType(forIdentifier: .dietaryMolybdenum),
            HKObjectType.quantityType(forIdentifier: .dietaryPantothenicAcid),
            HKObjectType.quantityType(forIdentifier: .dietaryPhosphorus),
            HKObjectType.quantityType(forIdentifier: .dietarySelenium),
            HKObjectType.quantityType(forIdentifier: .dietaryZinc)
       ]
        healthStore.requestAuthorization(toShare: (typesToWrite as! Set<HKSampleType>), read: (typesToRead as! Set<HKObjectType>)) { (success, error) in
        }
        
        
    }
    //MARK: Biotin
    @IBAction func biotinAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let biotinQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryBiotin)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: valueDouble)
        var sample: HKQuantitySample? = nil
        if let biotinQuantityType = biotinQuantityType {
            sample = HKQuantitySample(type: biotinQuantityType
                                      , quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Carbs
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
    //MARK: Protein
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
    //MARK: Fat
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
    //MARK: Sugar
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
    //MARK: Chloride
    @IBAction func chlorideAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let chlorideQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryChloride)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let chlorideQuantityType = chlorideQuantityType {
            sample = HKQuantitySample(type: chlorideQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            return
        }
    }
    //MARK: Chromium
    @IBAction func chromiumAction(_ value: NSString?) {
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valeDouble = Double(valueString)!
        let chromiumQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryChromium)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valeDouble))
        var sample: HKQuantitySample? = nil
        if let chromiumQuantityType = chromiumQuantityType {
            sample = HKQuantitySample(type: chromiumQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            return
        }
    }
    //MARK: Fiber
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
    //MARK: Copper
    @IBAction func copperAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let copperQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCopper)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: valueDouble)
        var sample: HKQuantitySample? = nil
        if let copperQuantityType = copperQuantityType {
            sample = HKQuantitySample(type: copperQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
  //MARK: Cholesterol
    @IBAction func cholesterolAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let choQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryCholesterol)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: valueDouble)
        var sample: HKQuantitySample? = nil
        if let choQuantityType = choQuantityType {
            sample = HKQuantitySample(type: choQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Vita C
    @IBAction func vitaC(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let vitaCQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminC)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let vitaCQuantityType = vitaCQuantityType {
            sample = HKQuantitySample(type: vitaCQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Vita D
    @IBAction func vitaDAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let vitaDQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminD)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let vitaDQuantityType = vitaDQuantityType {
            sample = HKQuantitySample(type: vitaDQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(succes, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    
    //MARK: Calcium
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
    //MARK: Vita E
    @IBAction func vitaEAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let vitaEQuantiyType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminE)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let vitaeQuantityType = vitaEQuantiyType {
            sample = HKQuantitySample(type: vitaeQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Vita K
    @IBAction func vitaKAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let vitaKQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminK)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let vitaKQuantityType = vitaKQuantityType {
            sample = HKQuantitySample(type: vitaKQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    
    //MARK: Sat Fat
    @IBAction func satFatAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let satFatQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryFatSaturated)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let satFatQuantityType = satFatQuantityType {
            sample = HKQuantitySample(type: satFatQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (sucess, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    
    //MARK: Iron
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
    //MARK: Folate
    @IBAction func folateAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let folateQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryFolate)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let folateQuantityType = folateQuantityType {
            sample = HKQuantitySample(type: folateQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Nicacin
    @IBAction func niacinAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let niacinQuantiyType = HKQuantityType.quantityType(forIdentifier: .dietaryNiacin)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let niacinQuantityType = niacinQuantiyType {
            sample = HKQuantitySample(type: niacinQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Potassium
    @IBAction func potasAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let potasQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryPotassium)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let potasQuantityType = potasQuantityType {
            sample = HKQuantitySample(type: potasQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (sucess, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Riboflavin
    @IBAction func riboAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let riboQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryRiboflavin)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let riboQuantityType = riboQuantityType {
            sample = HKQuantitySample(type: riboQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (sucess, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Thiamin
    @IBAction func thiaminAction(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let thiaminQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryThiamin)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let thiaminQuantityType = thiaminQuantityType {
            sample = HKQuantitySample(type: thiaminQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func vitaB6Action(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let vitaB6QuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminB6)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let vitaB6QuantityType = vitaB6QuantityType {
            sample = HKQuantitySample(type: vitaB6QuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func vitaB12Action(_ value: NSString?) {
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let vitaB12QuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminB12)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: valueDouble)
        var sample: HKQuantitySample? = nil
        if let vitaB12QuantityType = vitaB12QuantityType {
            sample = HKQuantitySample(type: vitaB12QuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (sucess, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func monoFatAction(_ value: NSString?) { //Gram
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let monoFatQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryFatMonounsaturated)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let monoFatQuantityType = monoFatQuantityType {
            sample = HKQuantitySample(type: monoFatQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func polyFat(_ value: NSString?) {//Gram
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let polyFatQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryFatPolyunsaturated)
        let unit = HKUnit.gram()
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let polyQuantityType = polyFatQuantityType {
            sample = HKQuantitySample(type: polyQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success,error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func iodineAction(_ value: NSString?) { //MCG
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let iodineQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryIodine)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let iodineQuantityType = iodineQuantityType {
            sample = HKQuantitySample(type: iodineQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func magnesiumAction(_ value: NSString?) { //Milli
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let magnesiumQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryMagnesium)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let magnesiumQuantityType = magnesiumQuantityType {
            sample = HKQuantitySample(type: magnesiumQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        
    }
    @IBAction func maganeseAction(_ value: NSString?) { //milli
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let maganeseQuantityType =  HKQuantityType.quantityType(forIdentifier: .dietaryManganese)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let manganeseQuantityType = maganeseQuantityType {
            sample = HKQuantitySample(type: manganeseQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func molybdenumAction(_ value: NSString?) {//mcg
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let molyQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryMolybdenum)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let molyQuantityType = molyQuantityType {
            sample = HKQuantitySample(type: molyQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func pantoacidAction(_ value: NSString?) {//milli
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let panthoQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryPantothenicAcid)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let pantoQuantityType = panthoQuantityType {
            sample = HKQuantitySample(type: pantoQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func phosphAction(_ value: NSString?) {//milli
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let phosphQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryPhosphorus)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let phosphQuantityType = phosphQuantityType {
            sample = HKQuantitySample(type: phosphQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func seleniumAction(_ value: NSString?) {//micro
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let seleniumQuantityType = HKQuantityType.quantityType(forIdentifier: .dietarySelenium)
        let unit = HKUnit.gramUnit(with: .micro)
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let seleniumQuantityType = seleniumQuantityType {
            sample = HKQuantitySample(type: seleniumQuantityType, quantity: quantityType , start: startDate, end: endDate)
        }
        healthStore.save(sample!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    @IBAction func zincAction(_ value: NSString?) {//milli
        WKInterfaceDevice.current().play(.success)
        guard let unwrappedValue = value else {
            return
        }
        let valueString = String(unwrappedValue)
        let valueDouble = Double(valueString)!
        let zincQuantityType = HKQuantityType.quantityType(forIdentifier: .dietaryZinc)
        let unit = HKUnit.gramUnit(with: .milli)
        let now = Date()
        let startDate = now.addingTimeInterval(60)
        let endDate = now
        let quantityType = HKQuantity(unit: unit, doubleValue: Double(valueDouble))
        var sample: HKQuantitySample? = nil
        if let zincQuantityType = zincQuantityType {
            sample = HKQuantitySample(type: zincQuantityType, quantity: quantityType, start: startDate, end: endDate)
        }
        healthStore.save(sample!) { (success, error) in
            DispatchQueue.main.async {
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
