//
//  Reminder.swift
//  app1021
//
//  Created by Dias Atudinov on 05.11.2024.
//

import Foundation

struct Reminder: Hashable, Codable {
    
    var id = UUID()
    var name: String
    var date: Date
    var replacements: [String]
    
}
