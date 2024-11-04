//
//  CalendarViewModel.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var calendars: [CalendarMain] = [
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
    
    private let fileName = "calendars.json"
    
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
                let data = try encoder.encode(self.calendars)
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
            calendars = try decoder.decode([CalendarMain].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    func addCalendar(_ calendar: CalendarMain) {
        calendars.append(calendar)
    }
    
    func deleteCalendar(_ calendar: CalendarMain) {
        if let index = calendars.firstIndex(where: { $0.id == calendar.id }) {
            calendars.remove(at: index)
        }
    }
}
