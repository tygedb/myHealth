//
//  ProgramObject.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 8/8/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit

class ProgramObject: NSObject {
    var title : String?
    var details: String?
    
    
    func initWithData(title: String, details: String) {
        self.title = title
    }
}
