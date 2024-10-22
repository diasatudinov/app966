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
            save()
        }
    }
    
    private let fileName = "home.json"
    
    init() {
        load()
        calculateProgress(lifts: home.lifts, goalLifts: home.goalLifts)
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func filePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(fileName)
    }
    
   
    
    private func save() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.home)
                try data.write(to: self.filePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func load() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: filePath())
            home = try decoder.decode(Home.self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
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
