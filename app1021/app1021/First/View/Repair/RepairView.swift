//
//  RepairView.swift
//  app1021
//
//  Created by Dias Atudinov on 31.10.2024.
//

import SwiftUI

struct RepairView: View {
    @StateObject var maintenanceVM = MaintenanceViewModel()
    @StateObject var reminderVM = RemindersViewModel()
    @ObservedObject var repairVM: RepairsViewModel
    @State private var goToContacts = false
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                NavigationBarView(rightImage: "phone.fill", rightButton: {goToContacts = true}, title: "Repairs").navigationBarBackButtonHidden()
                ScrollView {
                    VStack(spacing: 16) {
                        VStack(spacing: 0) {
                            HStack {
                                Text("Maintenance")
                                    .font(.system(size: 17, weight: .semibold))
                                Spacer()
                            }.padding(.bottom, 4)
                            
                            if maintenanceVM.accessories.isEmpty {
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
                                
                                NavigationLink {
                                    MaintenanceView(viewModel: maintenanceVM)
                                        .navigationBarBackButtonHidden()
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
                            } else {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(9)
                                        .foregroundColor(.secondaryBg)
                                    
                                    VStack {
                                        HStack(spacing: 25) {
                                            Text("Accessories")
                                                .font(.system(size: 28, weight: .bold))
                                            
                                                .lineSpacing(10)
                                            Spacer()
                                            NavigationLink {
                                                MaintenanceView(viewModel: maintenanceVM)
                                                    .navigationBarBackButtonHidden()
                                            } label: {
                                                Image(systemName: "pencil")
                                                    .font(.system(size: 17, weight: .medium))
                                            }
                                        }.foregroundColor(.white)
                                        
                                        ForEach(maintenanceVM.accessories.prefix(5), id: \.self) { accessory in
                                            
                                            HStack {
                                                Image(systemName: "book.and.wrench.fill")
                                                    .font(.system(size: 11, weight: .regular))
                                                    .foregroundColor(.yellowBtn)
                                                Text(accessory.name)
                                                    .font(.system(size: 13, weight: .semibold))
                                                    .foregroundColor(.white)
                                                Spacer()
                                                Text(accessory.state)
                                                    .font(.system(size: 13, weight: .semibold))
                                                    .foregroundColor(.yellowBtn)
                                            }
                                        }
                                        
                                        Spacer()
                                    }.padding()
                                }.frame(height: 184).padding(.bottom, 16)
                            }
                            
                            
                        }
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text("Reminders")
                                    .font(.system(size: 17, weight: .semibold))
                                Spacer()
                                if !reminderVM.remainders.isEmpty {
                                    NavigationLink {
                                        RemindersView(viewModel: reminderVM).navigationBarBackButtonHidden()
                                        
                                    } label: {
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.black)
                                    }
                                }
                            }.padding(.bottom, 4)
                            
                            if reminderVM.remainders.isEmpty {
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
                                
                                NavigationLink {
                                    RemindersView(viewModel: reminderVM).navigationBarBackButtonHidden()
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
                            } else {
                                ForEach(reminderVM.remainders, id: \.self) { reminder in
                                    RemainderCell(viewModel: reminderVM, remainder: reminder)
                                        .padding(.top)
                                }
                            }
                        }
                    }.padding(.horizontal).padding(.top, 30).padding(.bottom, 50)
                    
                }
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
