//
//  MotorcycleViewModel.swift
//  app1021
//
//  Created by Dias Atudinov on 30.10.2024.
//

import Foundation

class MotorcycleViewModel: ObservableObject {
    @Published var motorcycle: Motorcycle?
    
    func addMoto(_ moto: Motorcycle) {
        motorcycle = moto
    }
}
