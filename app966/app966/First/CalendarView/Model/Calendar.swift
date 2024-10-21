//
//  Calendar.swift
//  app966
//
//  Created by Dias Atudinov on 21.10.2024.
//

import Foundation

struct Calendar: Hashable, Codable {
    
    var id = UUID()
    var date: String
    var location: String
    var height: String
    var equipments: [String]
    
}
