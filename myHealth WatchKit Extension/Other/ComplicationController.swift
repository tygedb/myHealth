//
//  ComplicationController.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 8/8/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import ClockKit
import WatchKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    // MARK: - Complication Configuration

    @available(watchOSApplicationExtension 7.0, *)
    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "myHealth", supportedFamilies: CLKComplicationFamily.allCases)
            // Multiple complication support can be added here with more descriptors
        ]
      
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    @available(watchOSApplicationExtension 7.0, *)
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }
  
    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        
        handler(Date().addingTimeInterval(24.0 * 60.0 * 60.0))
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.hideOnLockScreen)
    }

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        if complication.family == .modularLarge {
            let myDelegate = WKExtension.shared().delegate as! ExtensionDelegate
            let template = CLKComplicationTemplateModularLargeStandardBody()
            
        }
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        handler(nil)
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        var template: CLKComplicationTemplateGraphicCircularImage?
//
//        switch complication.family {
//
//        case .modularSmall:
//            template = CLKComplicationTemplateGraphicCircularImage()
//
//
//        case .modularLarge:
//
//        case .utilitarianSmall:
//
//        case .utilitarianSmallFlat:
//
//        case .utilitarianLarge:
//
//        case .circularSmall:
//
//        case .extraLarge:
//
//        case .graphicCorner:
//
//        case .graphicBezel:
//
//        case .graphicCircular:
//
//        case .graphicRectangular:
//
//        case .graphicExtraLarge:
//
//        @unknown default:
//
//        }
//            
        handler(template)
       
    }
    public func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void){
        
    }
    public func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimelineEntry?) -> Void){
        
    }
    public func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        
    }
   
}
