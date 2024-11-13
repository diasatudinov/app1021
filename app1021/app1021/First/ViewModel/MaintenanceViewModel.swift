//
//  MaintenanceViewModel.swift
//  app1021
//
//  Created by Dias Atudinov on 05.11.2024.
//

import Foundation

class MaintenanceViewModel: ObservableObject {
    @Published var accessories: [Accessory] = [] {
        didSet {
            save()
        }
    }
    
    private let fileName = "accessories.json"
    
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
                let data = try encoder.encode(self.accessories)
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
            accessories = try decoder.decode([Accessory].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    
    func addAccessory(_ accessory: Accessory) {
        accessories.append(accessory)
    }
    
    func deleteAccessory(_ accessory: Accessory) {
        if let index = accessories.firstIndex(where: { $0.id == accessory.id }) {
            accessories.remove(at: index)
        }
    }
}
