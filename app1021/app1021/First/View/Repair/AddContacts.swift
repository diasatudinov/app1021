//
//  AddContacts.swift
//  app1021
//
//  Created by Dias Atudinov on 31.10.2024.
//

import SwiftUI

struct AddContacts: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var repairVM: RepairsViewModel
    
    @State private var name = ""
    @State private var employeeName = ""
    @State private var number = ""
    var body: some View {
        ZStack {
            
            VStack {
                
                NavigationBarView(leftButton: {presentationMode.wrappedValue.dismiss()}, title: "Contacts")
                
                VStack(spacing: 7) {
                    
                    FieldCell(name: "Name", bindText: $name, type: .default)
                    
                    FieldCell(name: "Employee", bindText: $employeeName, type: .default)
                    
                    FieldCell(name: "Number", bindText: $number, type: .numberPad)
                }.padding(.horizontal).padding(.top)
                Spacer()
                
                Button {
                    if  !name.isEmpty && !employeeName.isEmpty && !number.isEmpty {
                        let contact = Contact(name: name, employeeName: employeeName, number: number)
                        repairVM.addContact(contact)
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(13)
                            .foregroundColor(!name.isEmpty && !employeeName.isEmpty && !number.isEmpty ? .yellowBtn : .secondaryBg)
                        
                        HStack(spacing: 25) {
                            
                            Text("Save")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(!name.isEmpty && !employeeName.isEmpty && !number.isEmpty ? .secondaryBg : .white.opacity(0.16))
                                .lineSpacing(10)
                        }
                    }.frame(height: 45)
                }
            }.padding(.horizontal)
        }
    }
    
    //MARK: -FieldCell View
    @ViewBuilder func FieldCell(name: String, bindText: Binding<String>, type: UIKeyboardType) -> some View {
        HStack(spacing: 40) {
            
            Text(name)
                .foregroundColor(.white)
            
            TextField(name, text: bindText)
                .keyboardType(type)
                .foregroundColor(.white)
            
        }.padding(11).padding(.horizontal, 10).background(Color.secondaryBg).cornerRadius(13)
    }
}

#Preview {
    AddContacts(repairVM: RepairsViewModel())
}
