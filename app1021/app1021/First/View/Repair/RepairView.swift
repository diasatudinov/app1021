//
//  RepairView.swift
//  app1021
//
//  Created by Dias Atudinov on 31.10.2024.
//

import SwiftUI

struct RepairView: View {
    @ObservedObject var repairVM: RepairsViewModel
    @State private var goToContacts = false
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                NavigationBarView(rightImage: "phone.fill", rightButton: {goToContacts = true}, title: "Repairs")
                
                VStack(spacing: 16) {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Maintenance")
                                .font(.system(size: 17, weight: .semibold))
                            Spacer()
                        }.padding(.bottom, 4)
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 25) {
                                Image(systemName: "book.and.wrench.fill")
                                    .font(.system(size: 55, weight: .regular))
                                    .foregroundColor(.yellowBtn)
                                
                                Text("No accessories")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.yellowBtn)
                                    .lineSpacing(10)
                            }
                        }.frame(height: 139).padding(.bottom, 16)
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(13)
                                    .foregroundColor(.yellowBtn)
                                
                                HStack(spacing: 25) {
                                    
                                    Text("Add")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.secondaryBg)
                                        .lineSpacing(10)
                                }
                            }.frame(height: 45)
                        }
                    }
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("Reminders")
                                .font(.system(size: 17, weight: .semibold))
                            Spacer()
                        }.padding(.bottom, 4)
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 45) {
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 55, weight: .regular))
                                    .foregroundColor(.yellowBtn)
                                
                                Text("No entries")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.yellowBtn)
                                    .lineSpacing(10)
                            }
                        }.frame(height: 139).padding(.bottom, 16)
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(13)
                                    .foregroundColor(.yellowBtn)
                                
                                HStack(spacing: 25) {
                                    
                                    Text("Add")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.secondaryBg)
                                        .lineSpacing(10)
                                }
                            }.frame(height: 45)
                        }
                    }
                }.padding(.horizontal).padding(.top, 30)
                
                Spacer()
            }.padding(.horizontal)
            
            NavigationLink(
                destination: ContactsView(repairVM: repairVM).navigationBarBackButtonHidden(),
                isActive: $goToContacts,
                label: {
                    EmptyView()
                }
            )
        }
    }
}

#Preview {
    RepairView(repairVM: RepairsViewModel())
}
