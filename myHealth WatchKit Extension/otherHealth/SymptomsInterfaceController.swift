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
@available(watchOSApplicationExtension 7.0, *)
class SymptomsInterfaceController: WKInterfaceController {

    let healthStore = HKHealthStore()
        
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
//                HKCategoryType.categoryType(forIdentifier: .abdominalCramps)
//                HKCategoryType.categoryType(forIdentifier: .bladderIncontinence)
//                HKCategoryType.categoryType(forIdentifier: .bloating)
//                HKCategoryType.categoryType(forIdentifier: .vomiting)
//                HKCategoryType.categoryType(forIdentifier: .breastPain)
//                HKCategoryType.categoryType(forIdentifier: .chestTightnessOrPain)
//                HKCategoryType.categoryType(forIdentifier: .coughing)
//                HKCategoryType.categoryType(forIdentifier: .vomiting)
//                HKCategoryType.categoryType(forIdentifier: .chills)
//                HKCategoryType.categoryType(forIdentifier: .constipation)
//                HKCategoryType.categoryType(forIdentifier: .diarrhea)
//                HKCategoryType.categoryType(forIdentifier: .dizziness)
//                HKCategoryType.categoryType(forIdentifier: .fainting)
//                HKCategoryType.categoryType(forIdentifier: .fatigue)
//                HKCategoryType.categoryType(forIdentifier: .fever)
//                HKCategoryType.categoryType(forIdentifier: .lossOfSmell)
//                HKCategoryType.categoryType(forIdentifier: .lossOfTaste)
//                HKCategoryType.categoryType(forIdentifier: .headache)
//                HKCategoryType.categoryType(forIdentifier: .heartburn)
//
//
//                // Fallback on earlier versions
//
//           func activateHealthKit() {
//                let typesToShare: Set = [
//
//                    HKCategoryType.categoryType(forIdentifier: .abdominalCramps),
//                    HKCategoryType.categoryType(forIdentifier: .bladderIncontinence),
//                    HKCategoryType.categoryType(forIdentifier: .bloating),
//                    HKCategoryType.categoryType(forIdentifier: .vomiting),
//                    HKCategoryType.categoryType(forIdentifier: .breastPain),
//                    HKCategoryType.categoryType(forIdentifier: .chestTightnessOrPain),
//                    HKCategoryType.categoryType(forIdentifier: .coughing),
//                    HKCategoryType.categoryType(forIdentifier: .vomiting),
//                    HKCategoryType.categoryType(forIdentifier: .chills),
//                    HKCategoryType.categoryType(forIdentifier: .constipation),
//                    HKCategoryType.categoryType(forIdentifier: .diarrhea),
//                    HKCategoryType.categoryType(forIdentifier: .dizziness),
//                    HKCategoryType.categoryType(forIdentifier: .fainting),
//                    HKCategoryType.categoryType(forIdentifier: .fatigue),
//                    HKCategoryType.categoryType(forIdentifier: .fever),
//                    HKCategoryType.categoryType(forIdentifier: .lossOfSmell),
//                    HKCategoryType.categoryType(forIdentifier: .lossOfTaste),
//                    HKCategoryType.categoryType(forIdentifier: .headache),
//                    HKCategoryType.categoryType(forIdentifier: .heartburn)
//
//               ]
//
//               // The quantity types to read from the health store.
//               let typesToRead: Set = [
//                HKCategoryType.categoryType(forIdentifier: .abdominalCramps),
//                HKCategoryType.categoryType(forIdentifier: .bladderIncontinence),
//                HKCategoryType.categoryType(forIdentifier: .bloating),
//                HKCategoryType.categoryType(forIdentifier: .vomiting),
//                HKCategoryType.categoryType(forIdentifier: .breastPain),
//                HKCategoryType.categoryType(forIdentifier: .chestTightnessOrPain),
//                HKCategoryType.categoryType(forIdentifier: .coughing),
//                HKCategoryType.categoryType(forIdentifier: .vomiting),
//                HKCategoryType.categoryType(forIdentifier: .chills),
//                HKCategoryType.categoryType(forIdentifier: .constipation),
//                HKCategoryType.categoryType(forIdentifier: .diarrhea),
//                HKCategoryType.categoryType(forIdentifier: .dizziness),
//                HKCategoryType.categoryType(forIdentifier: .fainting),
//                HKCategoryType.categoryType(forIdentifier: .fatigue),
//                HKCategoryType.categoryType(forIdentifier: .fever),
//                HKCategoryType.categoryType(forIdentifier: .lossOfSmell),
//                HKCategoryType.categoryType(forIdentifier: .lossOfTaste),
//                HKCategoryType.categoryType(forIdentifier: .headache),
//                HKCategoryType.categoryType(forIdentifier: .heartburn)
//
//
//               ]
//            healthStore.requestAuthorization(toShare: (typesToShare as! Set<HKSampleType>), read: (typesToRead as! Set<HKObjectType>)) { (success, error) -> Void in
//           }
//        }
//
//    }
//
//    @IBAction func heartBurn() {
//        var heartBurnNP = HKCategoryType.categoryType(forIdentifier: .heartburn)
//        let hBNP = HKCategoryValueSeverity.notPresent
//        let now = Date()
//        let startDate = now.addingTimeInterval(-60)
//        let endDate = now
//
//    }
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
