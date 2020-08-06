//
//  IntentHandler.swift
//  Siri Intents
//
//  Created by Tyge Bellinger on 8/3/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import Intents

class IntentHandler: INExtension, INStartWorkoutIntentHandling, INEndWorkoutIntentHandling {
    
    func handle(intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        print("Start Workout Intent:", intent)
        
        let userActivity: NSUserActivity? = nil
        guard let spokenPhrase = intent.workoutName?.spokenPhrase else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: userActivity))
            return
        }
        print(spokenPhrase)
        completion(INStartWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity))
    }
    func handle(intent: INEndWorkoutIntent, completion: @escaping (INEndWorkoutIntentResponse) -> Void) {
        
    }
}
