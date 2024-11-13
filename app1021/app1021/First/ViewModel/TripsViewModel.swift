//
//  TripsViewModel.swift
//  app1021
//
//  Created by Dias Atudinov on 07.11.2024.
//

import SwiftUI

class TripsViewModel: ObservableObject {
    @Published var trips: [Trip] = [] {
        didSet {
            save()
        }
    }
    
    private let fileName = "trips.json"
    
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
                let data = try encoder.encode(self.trips)
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
            trips = try decoder.decode([Trip].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    
    func addTrip(_ trip: Trip) {
        trips.append(trip)
    }
    
    func deleteTrip(_ trip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips.remove(at: index)
        }
    }
    
    func editTrip(_ trip: Trip, name: String, distance: String, date: Date, replacements: [String]) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips[index].name = name
            trips[index].distance = distance
            trips[index].date = date
            trips[index].stops = replacements
        }
    }
}
