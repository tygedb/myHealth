//
//  HeartHealthyInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/11/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class HeartHealthyInterfaceController: WKInterfaceController {

    let healthStore = HKHealthStore()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    

    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
         let typesToWrite = Set  ([
                 HKObjectType.quantityType(forIdentifier: .dietaryProtein),
                 HKCategoryType.quantityType(forIdentifier: .dietaryFiber),
                 HKCategoryType.quantityType(forIdentifier: .dietaryCarbohydrates),
                 HKCategoryType.quantityType(forIdentifier: .dietaryPotassium),
                 HKCategoryType.quantityType(forIdentifier: .dietaryNiacin),
                 HKCategoryType.quantityType(forIdentifier: .dietaryThiamin),
                 HKCategoryType.quantityType(forIdentifier: .dietaryRiboflavin),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminB6),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminA),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminK),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminC),
                 HKCategoryType.quantityType(forIdentifier: .dietaryCopper),
                 HKCategoryType.quantityType(forIdentifier: .dietaryFolate),
                 HKCategoryType.quantityType(forIdentifier: .dietarySodium),
                 HKCategoryType.quantityType(forIdentifier: .dietarySugar),
                 HKCategoryType.quantityType(forIdentifier: .dietaryFatTotal),
                 HKCategoryType.quantityType(forIdentifier: .dietaryEnergyConsumed)
            
             ])
             let typesToRead = Set ([
                 //Asparagus
                 HKObjectType.quantityType(forIdentifier: .dietaryProtein),
                 HKCategoryType.quantityType(forIdentifier: .dietaryFiber),
                 HKCategoryType.quantityType(forIdentifier: .dietaryCarbohydrates),
                 HKCategoryType.quantityType(forIdentifier: .dietaryPotassium),
                 HKCategoryType.quantityType(forIdentifier: .dietaryNiacin),
                 HKCategoryType.quantityType(forIdentifier: .dietaryThiamin),
                 HKCategoryType.quantityType(forIdentifier: .dietaryRiboflavin),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminB6),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminA),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminK),
                 HKCategoryType.quantityType(forIdentifier: .dietaryVitaminC),
                 HKCategoryType.quantityType(forIdentifier: .dietaryCopper),
                 HKCategoryType.quantityType(forIdentifier: .dietaryFolate),
                 HKCategoryType.quantityType(forIdentifier: .dietarySodium),
                 HKCategoryType.quantityType(forIdentifier: .dietarySugar),
                 HKCategoryType.quantityType(forIdentifier: .dietaryFatTotal),
                 HKCategoryType.quantityType(forIdentifier: .dietaryEnergyConsumed)
             ])
             
                 self.healthStore.requestAuthorization(toShare: (typesToWrite as! Set<HKSampleType>), read: (typesToRead as! Set<HKObjectType>)) { (success, error) -> Void in
                                  
                    if !success {
                    print("HealthKit Auth Error\(String(describing: error))")
                        }
                 }
    }
   
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func activateHealthKit() {
     
      
    }
    
    @IBAction func asparagusAction() {
        WKInterfaceDevice.current().play(.success)
        //MARK: ASP Quantity Type
        let aspQuantityTypeCal = HKQuantityType.quantityType(forIdentifier: .dietaryEnergyConsumed)
        let asparagusQuantityTypeP = HKQuantityType.quantityType(forIdentifier: .dietaryProtein) // Protein
        let aspQuantityTypeFi = HKQuantityType.quantityType(forIdentifier: .dietaryFiber) // Fiber
        let aspQuantityTypeCarb = HKQuantityType.quantityType(forIdentifier: .dietaryCarbohydrates) // Carbs
        let aspQuantityTypeP = HKQuantityType.quantityType(forIdentifier: .dietaryPotassium) // Potassium
        let aspQuantityTypeN = HKQuantityType.quantityType(forIdentifier: .dietaryNiacin) // Niacin
        let aspQuantityTypeThi = HKQuantityType.quantityType(forIdentifier: .dietaryThiamin) //Thiamin
        let aspQuantityTypeRib = HKQuantityType.quantityType(forIdentifier: .dietaryRiboflavin) //Rib
        let aspQuantityTypeVitB6 = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminB6) //VitB6
        let aspQuantityTypeVitA = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminA) // Vit A
        let aspQuantityTypeVitK = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminK) // Vit K
        let aspQuantityTypeVitC = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminC) // Vit C
        let aspQuantityTypeCop = HKQuantityType.quantityType(forIdentifier: .dietaryCopper) // Copper
        let aspQuantityTypeFo = HKQuantityType.quantityType(forIdentifier: .dietaryFolate) // Folate
        let aspQuantityTypeIron = HKQuantityType.quantityType(forIdentifier: .dietaryIron) // Iron
        //MARK: Unit
        let unitCal = HKUnit(from:.calorie)
        let unitIr = HKUnit.gramUnit(with: .milli) //Iron
        let unitP = HKUnit.gram() // Protein
        let unitFi = HKUnit.gram() // Fiber
        let unitCarb = HKUnit.gram() // Carb
        let unitPo = HKUnit.gramUnit(with: .milli) // Potassium
        let unitNi = HKUnit.gramUnit(with: .milli) // Nicain
        let unitThi = HKUnit.gramUnit(with: .milli) // Thiamin
        let unitRib = HKUnit.gramUnit(with: .milli) // Rib
        let unitVB6 = HKUnit.gramUnit(with: .milli) // VB6
        let unitVitA = HKUnit.gramUnit(with: .micro) // Vit A
        let unitVitK = HKUnit.gramUnit(with: .micro)// VitK
        let unitVitC = HKUnit.gramUnit(with: .milli)// Vit C
        let unitCop = HKUnit.gramUnit(with: .micro)// Copper
        let unitFo = HKUnit.gramUnit(with: .micro)// Folate
        //MARK: ASP Amount
        let aspAmountCal = Int(20000) // Cal
        let aspAmountP = Int(3) // Protein
        let aspAmountFi = Int(3) // Fiber
        let aspAmountCarb = Int(5)// Carb
        let aspAmountPo = Int(271)// Potassium
        let aspAmountNi = Int(1.3000)// Niacin
        let aspAmountRib = Int(2000)// Rib
        let aspAmountThi = Int(2000)// Thiamin
        let aspAmountVB6 = Int(1000)//VB6
        let aspAmountVA = Int(1013)//Vit A
        let aspAmountVK = Int(55.7000)// Vit K
        let aspAmountVC = Int(7.5000)// Vit C
        let aspAmountCop = Int(3000)// Coper
        let aspAmountFo = Int(70)// Folate
        let aspAmountIron = Int(2.9000)// Iron
        
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        //MARK: Quantity
        let quantity0 = HKQuantity(unit: unitIr, doubleValue: Double(aspAmountIron)) // Iron
        let quantity1 = HKQuantity(unit: unitP, doubleValue: Double(aspAmountP)) // Protien
        let quantity2 = HKQuantity(unit: unitFi, doubleValue: Double(aspAmountFi)) // Fiber
        let quantity3 = HKQuantity(unit: unitCarb, doubleValue: Double(aspAmountCarb)) // Carb
        let quantity4 = HKQuantity(unit: unitPo, doubleValue: Double(aspAmountPo)) // Postassium
        let quantity5 = HKQuantity(unit: unitNi, doubleValue: Double(aspAmountNi)) // Niacin
        let quantity6 = HKQuantity(unit: unitThi, doubleValue: Double(aspAmountThi)) // Thiamin
        let quantity7 = HKQuantity(unit: unitRib, doubleValue: Double(aspAmountRib))// Rib
        let quantity8 = HKQuantity(unit: unitVB6, doubleValue: Double(aspAmountVB6))// Vit B6
        let quantity9 = HKQuantity(unit: unitVitA, doubleValue: Double(aspAmountVA)) // Vit A
        let quantity10 = HKQuantity(unit: unitVitK, doubleValue: Double(aspAmountVK)) // Vit K
        let quantity11 = HKQuantity(unit: unitVitC, doubleValue: Double(aspAmountVC)) // Vit C
        let quantity12 = HKQuantity(unit: unitCop, doubleValue: Double(aspAmountCop))// Copper
        let quantity13 = HKQuantity(unit: unitFo, doubleValue: Double(aspAmountFo))// Folate
        let quantity14 = HKQuantity(unit: unitCal, doubleValue: Double(aspAmountCal))
        //MARK: SAMPLE
        var sample0: HKQuantitySample? = nil
        var sample1: HKQuantitySample? = nil
        var sample2: HKQuantitySample? = nil
        var sample3: HKQuantitySample? = nil
        var sample4: HKQuantitySample? = nil
        var sample5: HKQuantitySample? = nil
        var sample6: HKQuantitySample? = nil
        var sample7: HKQuantitySample? = nil
        var sample8: HKQuantitySample? = nil
        var sample9: HKQuantitySample? = nil
        var sample10: HKQuantitySample? = nil
        var sample11: HKQuantitySample? = nil
        var sample12: HKQuantitySample? = nil
        var sample13: HKQuantitySample? = nil
        var sample14: HKQuantitySample? = nil
        //MARK: ASP SAMPLES
        if let asparagusQuantityTypeP = asparagusQuantityTypeP {
            sample0 = HKQuantitySample(type: asparagusQuantityTypeP, quantity: quantity1, start: startDate, end: endDate)
        }
        if let aspQuantityTypeFi = aspQuantityTypeFi {
            sample1 = HKQuantitySample(type: aspQuantityTypeFi, quantity: quantity2, start: startDate, end: endDate)
        }
        if let aspQuantityTypeCarb = aspQuantityTypeCarb {
            sample2 = HKQuantitySample(type: aspQuantityTypeCarb, quantity: quantity3, start: startDate, end: endDate)
        }
        if let aspQuantityTypeP = aspQuantityTypeP {
            sample3 = HKQuantitySample(type: aspQuantityTypeP, quantity: quantity4, start: startDate, end: endDate)
        }
        if let aspQuantityTypeN = aspQuantityTypeN {
            sample4 = HKQuantitySample(type: aspQuantityTypeN, quantity: quantity5, start: startDate, end: endDate)
        }
        if let aspQuantityTypeThi = aspQuantityTypeThi {
            sample5 = HKQuantitySample(type: aspQuantityTypeThi, quantity: quantity6, start: startDate, end: endDate)
        }
        if let aspQuantityTypeRib = aspQuantityTypeRib {
            sample6 = HKQuantitySample(type: aspQuantityTypeRib, quantity: quantity7, start: startDate, end: endDate)
        }
        if let aspQuantityTypeVitB6 = aspQuantityTypeVitB6 {
            sample7 = HKQuantitySample(type: aspQuantityTypeVitB6, quantity: quantity8, start: startDate, end: endDate)
        }
        if let aspQuantityTypeVitA = aspQuantityTypeVitA {
            sample8 = HKQuantitySample(type: aspQuantityTypeVitA, quantity: quantity9, start: startDate, end: endDate)
        }
        if let aspQuantityTypeVitK = aspQuantityTypeVitK {
            sample9 = HKQuantitySample(type: aspQuantityTypeVitK, quantity: quantity10, start: startDate, end: endDate)
        }
        if let aspQuantityTypeVitC = aspQuantityTypeVitC {
            sample10 = HKQuantitySample(type: aspQuantityTypeVitC, quantity: quantity11, start: startDate, end: endDate)
        }
        if let aspQuantityTypeCop = aspQuantityTypeCop {
            sample11 = HKQuantitySample(type: aspQuantityTypeCop, quantity: quantity12, start: startDate, end: endDate)
        }
        if let aspQuantityTypeFo = aspQuantityTypeFo {
            sample12 = HKQuantitySample(type: aspQuantityTypeFo, quantity: quantity13, start: startDate, end: endDate)
        }
        if let aspQuantityTypeIron = aspQuantityTypeIron {
            sample13 = HKQuantitySample(type: aspQuantityTypeIron, quantity: quantity0, start: startDate, end: endDate)
        }
        if let aspQuantityTypeCal = aspQuantityTypeCal {
            sample14 = HKQuantitySample(type: aspQuantityTypeCal, quantity: quantity14, start: startDate, end: endDate)
        }
        //MARK: HealthStore Save
        healthStore.save(sample0!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample1!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample2!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample3!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample4!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample5!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample6!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample7!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample8!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample9!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample10!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample11!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample12!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample13!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample14!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Tuna ACTION
    @IBAction func tunaAction() {
        WKInterfaceDevice.current().play(.success)
        //MARK: TUNA QUANTITY TYPE
        let tunaQuantityTypeF = HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)
        let tunaQuantityTypeS = HKQuantityType.quantityType(forIdentifier: .dietarySodium)
        let tunaQuantityTypeP = HKQuantityType.quantityType(forIdentifier: .dietaryProtein)
        //MARK: Unit Tuna
        let unitF = HKUnit.gram()
        let unitS = HKUnit.gramUnit(with: .milli)
        let unitP = HKUnit.gram()
        //MARK: Tuna Amount
        let tunaAmountF = Int(1.4)
        let tunaAmountS = Int(83)
        let tunaAmountP = Int(42)
        //MARK: Date
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        //MARK: Quantity
        let quantity0 = HKQuantity(unit: unitF, doubleValue: Double(tunaAmountF)) // Fat Total
        let quantity1 = HKQuantity(unit: unitS, doubleValue: Double(tunaAmountS)) // Sodium
        let quantity2 = HKQuantity(unit: unitP, doubleValue: Double(tunaAmountP)) // Protein
        //MARK: Sample
        var sample0: HKQuantitySample? = nil
        var sample1: HKQuantitySample? = nil
        var sample2: HKQuantitySample? = nil
        //MARK: Tuna Samples
        if let tunaQuantityTypeF = tunaQuantityTypeF {
            sample0 = HKQuantitySample(type: tunaQuantityTypeF, quantity: quantity0, start: startDate, end: endDate)
        }
        if let tunaQuantityTypeS = tunaQuantityTypeS {
            sample1 = HKQuantitySample(type: tunaQuantityTypeS, quantity: quantity1, start: startDate, end: endDate)
        }
        if let tunaQuantityTypeP = tunaQuantityTypeP {
            sample2 = HKQuantitySample(type: tunaQuantityTypeP, quantity: quantity2, start: startDate, end: endDate)
        }
        //MARK: HealthStore Save
        healthStore.save(sample0!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample1!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample2!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
    }
    //MARK: Salmon ACTION
    @IBAction func salmonAction() {
        WKInterfaceDevice.current().play(.success)
        //MARK: Salmon Quantity Type
        let salmonQuantityTypeF = HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)
        let salmonQuantityTypeS = HKQuantityType.quantityType(forIdentifier: .dietarySodium)
        let salmonQuantityTypeP = HKQuantityType.quantityType(forIdentifier: .dietaryProtein)
        //MARK: Salmon Amount
        let salmonAmountF = Int(1.4)
        let salmonAmountS = Int(37.4)
        let salmonAmountP = Int(17)
        //MARK: Unit Salmon
        let unitF = HKUnit.gram()
        let unitS = HKUnit.gramUnit(with: .milli)
        let unitP = HKUnit.gram()
        //MARK: Quantity
        let quantity0 = HKQuantity(unit: unitF, doubleValue: Double(salmonAmountF)) // Fat Total
        let quantity1 = HKQuantity(unit: unitS, doubleValue: Double(salmonAmountS)) // Sodium
        let quantity2 = HKQuantity(unit: unitP, doubleValue: Double(salmonAmountP)) // Protein
        //MARK: Sample
        var sample0: HKQuantitySample? = nil
        var sample1: HKQuantitySample? = nil
        var sample2: HKQuantitySample? = nil
        //MARK: Date
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        //MARK: Salmon Samples
        if let salmonQuantityTypeF = salmonQuantityTypeF {
            sample0 = HKQuantitySample(type: salmonQuantityTypeF, quantity: quantity0, start: startDate, end: endDate)
        }
        if let salmonQuantityTypeS = salmonQuantityTypeS {
            sample1 = HKQuantitySample(type: salmonQuantityTypeS, quantity: quantity1, start: startDate, end: endDate)
        }
        if let salmonQuantityTypeP = salmonQuantityTypeP {
            sample2 = HKQuantitySample(type: salmonQuantityTypeP, quantity: quantity2, start: startDate, end: endDate)
        }
        //MARK: Health Store Save
        healthStore.save(sample0!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample1!) {(success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample2!) {(success, error) in
              DispatchQueue.main.async {
                return
              }
          }
    }
    //MARK: Strawberry Action
    @IBAction func strawberryAction() {
        WKInterfaceDevice.current().play(.success)
        //MARK: Strawberry Quantity Type
        let stBQuantityTypeF = HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)
        let stBQuantityTypeC = HKQuantityType.quantityType(forIdentifier: .dietaryCarbohydrates)
        let stBQuantityTypeS = HKQuantityType.quantityType(forIdentifier: .dietarySodium)
        let stBQuantityTypeFi = HKQuantityType.quantityType(forIdentifier: .dietaryFiber)
        let stbQuantityTypeSg = HKQuantityType.quantityType(forIdentifier: .dietarySugar)
        let stBQuantityTypeP = HKQuantityType.quantityType(forIdentifier: .dietaryProtein)
        //MARK: StrawBerry Amount
        let stBAmountF = Int(0.50)
        let stBAmountC = Int(11.7)
        let stBAmountS = Int(1.5)
        let stBAmountFi = Int(3)
        let stBAmountSg = Int(7.40)
        let stBAmountP = Int(1)
        //MARK: StrawBerry Unit
        let unitF = HKUnit.gram()
        let unitC = HKUnit.gram()
        let unitS = HKUnit.gramUnit(with: .milli)
        let unitFi = HKUnit.gram()
        let unitSg = HKUnit.gram()
        let unitP = HKUnit.gram()
        //MARK: Quantity
        let quantity0 = HKQuantity(unit: unitF, doubleValue: Double(stBAmountF))
        let quantity1 = HKQuantity(unit: unitC, doubleValue: Double(stBAmountC))
        let quantity2 = HKQuantity(unit: unitS, doubleValue: Double(stBAmountS))
        let quantity3 = HKQuantity(unit: unitFi, doubleValue: Double(stBAmountFi))
        let quantity4 = HKQuantity(unit: unitSg, doubleValue: Double(stBAmountSg))
        let quantity5 = HKQuantity(unit: unitP, doubleValue: Double(stBAmountP))
        //MARK: Sample
         var sample0: HKQuantitySample? = nil
         var sample1: HKQuantitySample? = nil
         var sample2: HKQuantitySample? = nil
         var sample3: HKQuantitySample? = nil
         var sample4: HKQuantitySample? = nil
         var sample5: HKQuantitySample? = nil
        //MARK: Date
        let now = Date()
        let startDate = now.advanced(by: -60)
        let endDate = now
        //MARK: Strawberry Samples
        if let stBQuantityTypeF = stBQuantityTypeF {
            sample0 = HKQuantitySample(type: stBQuantityTypeF, quantity: quantity0, start: startDate, end: endDate)
        }
        if let stBQuantityTypeC = stBQuantityTypeC {
            sample1 = HKQuantitySample(type: stBQuantityTypeC, quantity: quantity1, start: startDate, end: endDate)
        }
        if let stBQuantityTypeS = stBQuantityTypeS {
            sample2 = HKQuantitySample(type: stBQuantityTypeS, quantity: quantity2, start: startDate, end: endDate)
        }
        if let stBQuantityTypeFi = stBQuantityTypeFi {
            sample3 = HKQuantitySample(type: stBQuantityTypeFi, quantity: quantity3, start: startDate, end: endDate)
        }
        if let stBQuantityTypeSg = stbQuantityTypeSg {
            sample4 = HKQuantitySample(type: stBQuantityTypeSg, quantity: quantity4, start: startDate, end: endDate)
        }
        if let stBQuantityTypeP = stBQuantityTypeP {
            sample5 = HKQuantitySample(type: stBQuantityTypeP, quantity: quantity5, start: startDate, end: endDate)
        }
        //MARK:Health Store Save
        healthStore.save(sample0!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample1!) { (success, error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample2!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
               }
        healthStore.save(sample3!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
               }
        healthStore.save(sample4!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
               }
        healthStore.save(sample5!) { (success, error) in
                   DispatchQueue.main.async {
                       return
                   }
               }
    }
    //MARK: BlueBerry
    @IBAction func blueberryAction() {
        WKInterfaceDevice.current().play(.success)
        //MARK: Quantity Type
        let bbQuantityTypeF = HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)
        let bbQuantityTypeS = HKQuantityType.quantityType(forIdentifier: .dietarySodium)
        let bbQuantityTypeC = HKQuantityType.quantityType(forIdentifier: .dietaryCarbohydrates)
        let bbQuantityTypeFi = HKQuantityType.quantityType(forIdentifier: .dietaryFiber)
        let bbQuantityTypeSg = HKQuantityType.quantityType(forIdentifier: .dietarySugar)
        let bbQuantityTypeP = HKQuantityType.quantityType(forIdentifier: .dietaryProtein)
        let bbQuantityTypeVC = HKQuantityType.quantityType(forIdentifier: .dietaryVitaminC)
        //MARK: Amount
        let bbAmountF = Int(0.50)
        let bbAmountS = Int(1.5)
        let bbAmountC = Int(21)
        let bbAmountFi = Int(3.60)
        let bbAmountSg = Int(15)
        let bbAmountP = Int(1)
        let bbAmountVC = Int(14.40)
        //MARK: Unit
        let unitF = HKUnit.gram()
        let unitS = HKUnit.gramUnit(with: .milli)
        let unitC = HKUnit.gram()
        let unitFi = HKUnit.gram()
        let unitSg = HKUnit.gram()
        let unitP = HKUnit.gram()
        let unitVC = HKUnit.gramUnit(with: .milli)
        //MARK: Quantity
        let quantity0 = HKQuantity(unit: unitF, doubleValue: Double(bbAmountF))
        let quantity1 = HKQuantity(unit: unitS, doubleValue: Double(bbAmountS))
        let quantity2 = HKQuantity(unit: unitC, doubleValue: Double(bbAmountC))
        let quantity3 = HKQuantity(unit: unitFi, doubleValue: Double(bbAmountFi))
        let quantity4 = HKQuantity(unit: unitSg, doubleValue: Double(bbAmountSg))
        let quantity5 = HKQuantity(unit: unitP, doubleValue: Double(bbAmountP))
        let quantity6 = HKQuantity(unit: unitVC, doubleValue: Double(bbAmountVC))
        //MARK: Sample
        var sample0: HKQuantitySample? = nil
        var sample1: HKQuantitySample? = nil
        var sample2: HKQuantitySample? = nil
        var sample3: HKQuantitySample? = nil
        var sample4: HKQuantitySample? = nil
        var sample5: HKQuantitySample? = nil
        var sample6: HKQuantitySample? = nil
        //MARK: Date
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        //MARK: Sample Types
        if let bbQuantityTypeF = bbQuantityTypeF {
            sample0 = HKQuantitySample(type: bbQuantityTypeF, quantity: quantity0, start: startDate, end: endDate)
        }
        if let bbQuantityTypeS = bbQuantityTypeS {
            sample1 = HKQuantitySample(type: bbQuantityTypeS, quantity: quantity1, start: startDate, end: endDate)
        }
        if let bbQuantityTypeC = bbQuantityTypeC {
            sample2 = HKQuantitySample(type: bbQuantityTypeC, quantity: quantity2, start: startDate, end: endDate)
        }
        if let bbQuantityTypeFi = bbQuantityTypeFi {
            sample3 = HKQuantitySample(type: bbQuantityTypeFi, quantity: quantity3, start: startDate, end: endDate)
        }
        if let bbQuantityTypeSg = bbQuantityTypeSg {
            sample4 = HKQuantitySample(type: bbQuantityTypeSg, quantity: quantity4, start: startDate, end: endDate)
        }
        if let bbQuantityTypeP = bbQuantityTypeP {
            sample5 = HKQuantitySample(type: bbQuantityTypeP, quantity: quantity5, start: startDate, end: endDate)
        }
        if let bbQuantityTypeVC = bbQuantityTypeVC {
            sample6 = HKQuantitySample(type: bbQuantityTypeVC, quantity: quantity6, start: startDate, end: endDate)
        }
        //MARK: Health Store Save
        healthStore.save(sample0!) {(success,error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample1!) {(success,error) in
            DispatchQueue.main.async {
                return
            }
        }
        healthStore.save(sample2!) {(success,error) in
            DispatchQueue.main.async {
                return
             }
        }
        healthStore.save(sample3!) {(success,error) in
            DispatchQueue.main.async {
                return
             }
        }
        healthStore.save(sample4!) {(success,error) in
             DispatchQueue.main.async {
                return
             }
        }
        healthStore.save(sample5!) {(success,error) in
             DispatchQueue.main.async {
                return
             }
        }
        healthStore.save(sample6!) {(success,error) in
             DispatchQueue.main.async {
                return
             }
        }
    }
    @IBAction func carrotsAction() {
        
        let carrotCal = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)
        let carrotPro = HKQuantityType.quantityType(forIdentifier: .dietaryProtein)
        let carrotCarb = HKQuantityType.quantityType(forIdentifier: .dietaryCarbohydrates)
        let carrortSug = HKQuantityType.quantityType(forIdentifier: .dietarySugar)
        let carrotFi = HKQuantityType.quantityType(forIdentifier: .dietaryFiber)
        let carrotFat = HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)
        
        let unitCal = HKUnit(from: .calorie)
        let unitPro = HKUnit.gram()
        let unitCarb = HKUnit.gram()
        let unitSug = HKUnit.gram()
        let unitFi = HKUnit.gram()
        let unitFat = HKUnit.gram()
        
        let carrotAmountCal = Int(41000)
        let carrotAmountPro = Int(90)
        let carrotAmountCarb = Int(9.600)
        let carrotAmountSug = Int(4.700)
        let carrotAmountFi = Int(2.800)
        let carrotAmountFa = Int(20)
        
        var sample0: HKQuantitySample? = nil
        var sample1: HKQuantitySample? = nil
        var sample2: HKQuantitySample? = nil
        var sample3: HKQuantitySample? = nil
        var sample4: HKQuantitySample? = nil
        var sample5: HKQuantitySample? = nil
        
        let quantity0 = HKQuantity(unit: unitCal, doubleValue: Double(carrotAmountCal))
        let quantity1 = HKQuantity(unit: unitPro, doubleValue: Double(carrotAmountPro))
        let quantity2 = HKQuantity(unit: unitCarb, doubleValue: Double(carrotAmountCarb))
        let quantity3 = HKQuantity(unit: unitSug, doubleValue: Double(carrotAmountSug))
        let quantity4 = HKQuantity(unit: unitFi, doubleValue: Double(carrotAmountFi))
        let quantity5 = HKQuantity(unit: unitFat, doubleValue: Double(carrotAmountFa))
        
        let now = Date()
        let startDate = now.addingTimeInterval(-60)
        let endDate = now
        
        if let carrotCal = carrotCal {
            sample0 = HKQuantitySample(type: carrotCal, quantity: quantity0, start: startDate, end: endDate)
        }
        if let carrotPro = carrotPro {
            sample1 = HKQuantitySample(type: carrotPro, quantity: quantity1, start: startDate, end: endDate)
        }
        if let carrotCarb = carrotCarb {
            sample2 = HKQuantitySample(type: carrotCarb, quantity: quantity2, start: startDate, end: endDate)
        }
        if let carrotSug = carrortSug {
            sample3 = HKQuantitySample(type: carrotSug, quantity: quantity3, start: startDate, end: endDate)
        }
        if let carrotFi = carrotFi {
            sample4 = HKQuantitySample(type: carrotFi, quantity: quantity4, start: startDate, end: endDate)
        }
        if let carrotFat = carrotFat {
            sample5 = HKQuantitySample(type: carrotFat, quantity: quantity5, start: startDate, end: endDate)
        }
        
        healthStore.save(sample0!) {(error, success) in
        DispatchQueue.main.async {
            return
        }
    }
        healthStore.save(sample1!) {(success,error) in
        DispatchQueue.main.async {
            return
            }
        }
        healthStore.save(sample2!) {(error, success) in
              DispatchQueue.main.async {
                  return
              }
          }
        healthStore.save(sample3!) {(error, success) in
              DispatchQueue.main.async {
                  return
              }
          }
        healthStore.save(sample4!) {(error, success) in
              DispatchQueue.main.async {
                  return
              }
          }
        healthStore.save(sample5!) {(error, success) in
              DispatchQueue.main.async {
                  return
              }
          }
    }
    
}
    
    

