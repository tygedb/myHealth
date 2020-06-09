//
//  NotificationController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/21/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications

class NotificationController: WKUserNotificationInterfaceController {
    
  
    class LocalNotificationManager {
        var notifications = [Notification]()
    
        func requestPermission() -> Void {
      let center = UNUserNotificationCenter.current()
      center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
          // Enable or disable features based on authorization.
      }
    }
        func schedule() {
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Time for water!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Time to take a break and drink some water!!",
                                                                    arguments: nil)
             
            // Configure the trigger for a 10am wakeup.
            var dateInfo = DateComponents()
            dateInfo.hour = 10
            dateInfo.minute = 0
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
             
            // Create the request object.
            let request = UNNotificationRequest(identifier: "Water Alarm", content: content, trigger: trigger)
            let center = UNUserNotificationCenter.current()
            center.add(request) { (error : Error?) in
                if let theError = error {
                    print(theError.localizedDescription)
                }
            }
        }
    
    }
    override init() {
        // Initialize variables here.
        super.init()
        
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

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        }
    }


