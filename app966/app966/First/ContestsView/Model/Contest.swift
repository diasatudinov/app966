//
//  Contest.swift
//  app966
//
//  Created by Dias Atudinov on 22.10.2024.
//

import Foundation

struct Contest: Hashable, Codable {
    var id = UUID()
    var date: String
    var location: String
    var height: String
    var note: String
}
