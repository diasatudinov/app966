//
//  CalendarViewModel.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var calendars: [Calendar] = [
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),
//        Calendar(date: "December 25, 2023", location: "Miami, USA", height: "3,2 Metrs", equipments: ["Surfboard", "Wetsuit"]),


    
    ]
    
    func addCalendar(_ calendar: Calendar) {
        calendars.append(calendar)
    }
    
    func deleteCalendar(_ calendar: Calendar) {
        if let index = calendars.firstIndex(where: { $0.id == calendar.id }) {
            calendars.remove(at: index)
        }
    }
}
