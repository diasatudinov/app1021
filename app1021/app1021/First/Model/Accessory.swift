//
//  Accessory.swift
//  app1021
//
//  Created by Dias Atudinov on 05.11.2024.
//

import Foundation

struct Accessory: Hashable, Codable {
    
    var id = UUID()
    var name: String
    var state: String = ""
    
}
