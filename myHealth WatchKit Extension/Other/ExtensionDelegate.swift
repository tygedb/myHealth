//
//  ExtensionDelegate.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 5/21/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import UIKit
import UserNotifications

class ExtensionDelegate: NSObject, WKExtensionDelegate, UNUserNotificationCenterDelegate {

    func applicationDidFinishLaunching() {
       UNUserNotificationCenter.current().delegate = self
    }
        // Perform any final initialization of your application
 

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       completionHandler([.alert, .badge, .sound])
   }
    
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        for task: WKRefreshBackgroundTask in backgroundTasks {
              print("received background task: ", task)
            
            if (WKExtension.shared().applicationState == .background) {
                print("Successfully entered in background task")
                
            }
            task.setTaskCompletedWithSnapshot(false)
        }
        
        
    }
    
    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

    func applicationDidEnterBackground() {
        
    }
   
}



