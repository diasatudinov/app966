//
//  HomeViewModel.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var home: Home = Home(resultHeight: "0", resultTime: "0", resultAvgSpeed: "0", goalHeight: "0", goalTime: "0", lifts: 0, goalLifts: 0) {
        didSet {
            calculateProgress(lifts: home.lifts, goalLifts: home.goalLifts)
        }
    }
    @Published var progress = 0.0
    
    private func calculateProgress(lifts: Double, goalLifts: Double) {
        var lifts = lifts
        var goalLifts = goalLifts
        guard goalLifts > 0 else { 
            goalLifts = 0.0
            progress = Double(lifts) / Double(goalLifts)
            return
        }
        guard goalLifts > lifts else { 
            lifts = goalLifts
            progress = Double(lifts) / Double(goalLifts)
            return
        }
        
        progress = Double(lifts) / Double(goalLifts)
    }
    
    func editResult(newHeight: String, newTime: String, newSpeed: String) {
        home.resultHeight = newHeight
        home.resultTime = newTime
        home.resultAvgSpeed = newSpeed
    }
    
    func editGoal(newHeight: String, newTime: String) {
        home.goalHeight = newHeight
        home.goalTime = newTime
    }
    
    func editLifts(newLifts: Double, newGoalLifts: Double) {
        home.lifts = newLifts
        home.goalLifts = newGoalLifts
    }
}
