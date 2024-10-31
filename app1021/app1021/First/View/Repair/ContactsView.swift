//
//  ContactsView.swift
//  app1021
//
//  Created by Dias Atudinov on 31.10.2024.
//

import SwiftUI

struct ContactsView: View {
    @ObservedObject var repairVM: RepairsViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var goToNewContacts = false
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                NavigationBarView(rightImage: "plus", leftButton: {presentationMode.wrappedValue.dismiss()}, rightButton: { goToNewContacts = true }, title: "Contacts")
                
                if repairVM.contacts.isEmpty {
                    ZStack {
                        Rectangle()
                            .cornerRadius(9)
                            .foregroundColor(.secondaryBg)
                        
                        HStack(spacing: 45) {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .foregroundColor(.yellowBtn)
                                .frame(height: 60)
                            
                            Text("No contacts")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.yellowBtn)
                                .lineSpacing(10)
                        }
                    }.frame(height: 139).padding(.top)
                } else {
                    ScrollView {
                        VStack {
                            ForEach(repairVM.contacts, id: \.self) { contact in
                                ContactCell(contact: contact, onDelete: {
                                    withAnimation {
                                        repairVM.deleteContact(contact: contact)
                                    }
                                })
                            }
                        }.padding(.horizontal, 33).padding(.top)
                    }.padding(.horizontal, -16)
                }
                
                Spacer()
                
                
            }.padding(.horizontal)
            
            NavigationLink(
                destination: AddContacts(repairVM: repairVM).navigationBarBackButtonHidden(),
                isActive: $goToNewContacts,
                label: {
                    EmptyView()
                }
            )
        }
    }
}

#Preview {
    ContactsView(repairVM: RepairsViewModel())
}
