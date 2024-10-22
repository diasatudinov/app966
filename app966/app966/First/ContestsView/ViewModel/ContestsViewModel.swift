//
//  ContestsViewModel.swift
//  app966
//
//  Created by Dias Atudinov on 22.10.2024.
//

import Foundation

class ContestsViewModel: ObservableObject {
    @Published var contests: [Contest] = [
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),


    
    ] {
        didSet {
            save()
        }
    }
    
    private let fileName = "contests.json"
    
    init() {
        load()
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
                let data = try encoder.encode(self.contests)
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
            contests = try decoder.decode([Contest].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    func addContest(_ contest: Contest) {
        contests.append(contest)
    }
    
    func deleteContest(_ contest: Contest) {
        if let index = contests.firstIndex(where: { $0.id == contest.id }) {
            contests.remove(at: index)
        }
    }
}
