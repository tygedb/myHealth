//
//  MoodInterfaceController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/12/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation


class MoodInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var smileyFace: WKInterfaceImage!
    @IBOutlet weak var moodPicker: WKInterfacePicker!
    
    var image: WKImage?
    
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
    @IBAction func moodPickerAction(_ value: Int) {
    }
    
}
