//
//  NutritionInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/26/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit
//import Alamofire

class NutritionInterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        
        
        if segueIdentifier == "heartFood" {
            self.presentController(withName: "heartFood", context: nil)
            
           
        }
        
        if segueIdentifier == "lunch" {
            self.presentController(withName: "addFood", context: nil)
            
        }
        
        if segueIdentifier == "dinner" {
            self.presentController(withName: "addFood", context: nil)
            
        }
        if segueIdentifier == "manual" {
            self.presentController(withName: "manual", context: nil)
        }
         return nil
    }
  
}
