//
//  yogaSessionView.swift
//  myHealth WatchKit Extension
//
//  Created by Tyge Bellinger on 6/7/20.
//  Copyright © 2020 Tyge Bellinger. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class yogaSessionView: WKInterfaceController, HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate {
   
    
  
    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var heartRateLabel: WKInterfaceLabel?
    @IBOutlet weak var calorieCountLabel: WKInterfaceLabel!
    @IBOutlet weak var pauseButton: WKInterfaceButton!
    @IBOutlet weak var stopButton: WKInterfaceButton!
    @IBOutlet weak var startButton: WKInterfaceButton!
    
    var healthStore: HKHealthStore!
          var configuration: HKWorkoutConfiguration!
          
          var session: HKWorkoutSession!
          var builder: HKLiveWorkoutBuilder!
          
          override func awake(withContext context: Any?) {
              super.awake(withContext: context)
              setupWorkoutSessionInterface(with: context)
            pauseButton.setAlpha(1)
            startButton.setAlpha(0)
              // Create the session and obtain the workout builder.
              /// - Tag: CreateWorkout
              do {
                  session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
                  builder = session.associatedWorkoutBuilder()
              } catch {
                  dismiss()
                  return
              }
              
              // Setup session and builder.
              session.delegate = self
              builder.delegate = self
              
              /// Set the workout builder's data source.
              /// - Tag: SetDataSource
              builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore,
                                                           workoutConfiguration: configuration)
              
              // Start the workout session and begin data collection.
              /// - Tag: StartSession
              session.startActivity(with: Date())
              builder.beginCollection(withStart: Date()) { (success, error) in
                  self.setDurationTimerDate(.running)
              }
          }
          
          // Track elapsed time.
          func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
              // Retreive the workout event.
              guard let workoutEventType = workoutBuilder.workoutEvents.last?.type else { return }
              
              // Update the timer based on the event received.
              switch workoutEventType {
              case .pause: // The user paused the workout.
                  setDurationTimerDate(.paused)
              case .resume: // The user resumed the workout.
                  setDurationTimerDate(.running)
              default:
                  return
                  
              }
          }
          
          func setDurationTimerDate(_ sessionState: HKWorkoutSessionState) {
              /// Obtain the elapsed time from the workout builder.
              /// - Tag: ObtainElapsedTime
              let timerDate = Date(timeInterval: -self.builder.elapsedTime, since: Date())
              
              // Dispatch to main, because we are updating the interface.
              DispatchQueue.main.async {
                  self.timer.setDate(timerDate)
              }
              
              // Dispatch to main, because we are updating the interface.
              DispatchQueue.main.async {
                  /// Update the timer based on the state we are in.
                  /// - Tag: UpdateTimer
                  sessionState == .running ? self.timer.start() : self.timer.stop()
              }
          }
          
          // MARK: - HKLiveWorkoutBuilderDelegate
          func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
              for type in collectedTypes {
                  guard let quantityType = type as? HKQuantityType else {
                      return // Nothing to do.
                  }
                  
                  /// - Tag: GetStatistics
                  let statistics = workoutBuilder.statistics(for: quantityType)
                  let label = labelForQuantityType(quantityType)
                  
                  updateLabel(label, withStatistics: statistics)
              }
          }
          
          // MARK: - State Control
          func pauseWorkout() {
              session.pause()
          }
          
          func resumeWorkout() {
              session.resume()
          }
          
          func endWorkout() {
              /// Update the timer based on the state we are in.
              /// - Tag: SaveWorkout
              session.end()
              builder.endCollection(withEnd: Date()) { (success, error) in
                  self.builder.finishWorkout { (workout, error) in
                      // Dispatch to main, because we are updating the interface.
                      DispatchQueue.main.async() {
                          self.dismiss()
                      }
                  }
              }
          }
          
          func setupWorkoutSessionInterface(with context: Any?) {
              guard let context = context as? yogaSessionContext else {
                  dismiss()
                  return
              }
              
              healthStore = context.healthStore
              configuration = context.configuration
              
             
          }
          
          /// Action for the "Pause" menu item.
          @IBAction func pauseWorkoutAction() {
            pauseButton.setAlpha(0)
            startButton.setAlpha(1)
            WKInterfaceDevice.current().play(.success)
              pauseWorkout()
          }
          
          /// Action for the "Resume" menu item.
          
          @IBAction func resumeWorkoutAction() {
            startButton.setAlpha(0)
            pauseButton.setAlpha(1)
            WKInterfaceDevice.current().play(.start)
              resumeWorkout()
          }
          
          /// Action for the "End" menu item.
          
          @IBAction func endWorkoutAction() {
            WKInterfaceDevice.current().play(.stop)
              endWorkout()
          }
          
          // MARK: - HKWorkoutSessionDelegate
          func workoutSession(
              _ workoutSession: HKWorkoutSession,
              didChangeTo toState: HKWorkoutSessionState,
              from fromState: HKWorkoutSessionState,
              date: Date
          ) {
              // Dispatch to main, because we are updating the interface.
              
          }
          
          func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
              // No error handling in this sample project.
          }
          
          // MARK: - Update the interface
          
          /// Retreive the WKInterfaceLabel object for the quantity types we are observing.
          func labelForQuantityType(_ type: HKQuantityType) -> WKInterfaceLabel? {
              switch type {
              case HKQuantityType.quantityType(forIdentifier: .heartRate):
                  return heartRateLabel
              case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                  return calorieCountLabel
              default:
                  return nil
              }
          }
          
          /// Update the WKInterfaceLabels with new data.
          func updateLabel(_ label: WKInterfaceLabel?, withStatistics statistics: HKStatistics?) {
              // Make sure we got non `nil` parameters.
              guard let label = label, let statistics = statistics else {
                  return
              }
              
              // Dispatch to main, because we are updating the interface.
              DispatchQueue.main.async {
                  switch statistics.quantityType {
                  case HKQuantityType.quantityType(forIdentifier: .heartRate):
                      /// - Tag: SetLabel
                      let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                      let value = statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit)
                      let roundedValue = Double( round( 1 * value! ) / 1 )
                      label.setText("\(roundedValue) BPM")
                  case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                      let energyUnit = HKUnit.largeCalorie()
                      let value = statistics.sumQuantity()?.doubleValue(for: energyUnit)
                      let roundedValue = Double( round( 1 * value! ) / 1 )
                      label.setText("\(roundedValue) cal")
                      return
                  default:
                      return
                  }
              }
          }
          
       }

    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
           
       }
       
       func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
           
       }


