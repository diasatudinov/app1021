//
//  Motorcycle.swift
//  app1021
//
//  Created by Dias Atudinov on 30.10.2024.
//

import SwiftUI

struct Motorcycle {
    
    var imageData: Data?
    var brand: String
    var model: String
    var year: Int
    var mileage: Int
    var engine: String
    var cylinders: Int
    var volume: String
    var image: UIImage? {
        get {
            guard let data = imageData else { return nil }
            return UIImage(data: data)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
}
