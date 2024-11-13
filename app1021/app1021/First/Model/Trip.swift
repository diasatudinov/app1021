//
//  Trip.swift
//  app1021
//
//  Created by Dias Atudinov on 07.11.2024.
//

import Foundation

struct Trip: Hashable, Codable {
    
    var id = UUID()
    var name: String
    var distance: String
    var date: Date
    var stops: [String]
}
