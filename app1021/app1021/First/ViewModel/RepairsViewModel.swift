//
//  RepairsViewModel.swift
//  app1021
//
//  Created by Dias Atudinov on 31.10.2024.
//

import Foundation

class RepairsViewModel: ObservableObject {
    @Published var contacts: [Contact] = [
        Contact(name: "Technical inspection", employeeName: "Migel", number: "+12345678900"),
        Contact(name: "Technical inspection", employeeName: "Migel", number: "+12345678900"),
        Contact(name: "Technical inspection", employeeName: "Migel", number: "+12345678900"),
        Contact(name: "Technical inspection", employeeName: "Migel", number: "+12345678900"),
        Contact(name: "Technical inspection", employeeName: "Migel", number: "+12345678900")
    
    ]
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func deleteContact(contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts.remove(at: index)
        }
    }
}
