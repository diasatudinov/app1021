//
//  RemindersViewModel.swift
//  app1021
//
//  Created by Dias Atudinov on 05.11.2024.
//

import Foundation

class RemindersViewModel: ObservableObject {
    @Published var remainders: [Reminder] = [] {
        didSet {
            save()
        }
    }
    
    private let fileName = "remainders.json"
    
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
                let data = try encoder.encode(self.remainders)
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
            remainders = try decoder.decode([Reminder].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    
    func addReminder(_ reminder: Reminder) {
        remainders.append(reminder)
    }
    
    func deleteReminder(_ reminder: Reminder) {
        if let index = remainders.firstIndex(where: { $0.id == reminder.id }) {
            remainders.remove(at: index)
        }
    }
    
    func editReminder(_ reminder: Reminder, name: String, date: Date, replacements: [String]) {
        if let index = remainders.firstIndex(where: { $0.id == reminder.id }) {
            remainders[index].name = name
            remainders[index].date = date
            remainders[index].replacements = replacements
        }
    }
}
