//
//  TripsView.swift
//  app1021
//
//  Created by Dias Atudinov on 07.11.2024.
//

import SwiftUI

struct TripsView: View {
    @ObservedObject var tripVM: TripsViewModel
    @State private var goToContacts = false
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                NavigationBarView(title: "Trips").navigationBarBackButtonHidden()
                ScrollView {
                    VStack(spacing: 16) {
                        VStack(spacing: 0) {
                            HStack {
                                Text("Maintenance")
                                    .font(.system(size: 17, weight: .semibold))
                                Spacer()
                            }.padding(.bottom, 4)
                            
                            if tripVM.trips.isEmpty {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(9)
                                        .foregroundColor(.secondaryBg)
                                    
                                    HStack(spacing: 25) {
                                        Image(systemName: "map.fill")
                                            .font(.system(size: 55, weight: .regular))
                                            .foregroundColor(.yellowBtn)
                                        
                                        Text("No scheduled trips")
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.yellowBtn)
                                            .lineSpacing(10)
                                    }
                                }.frame(height: 139).padding(.bottom, 16)
                                
                                NavigationLink {
                                  //  MaintenanceView(viewModel: maintenanceVM)
                                    //    .navigationBarBackButtonHidden()
                                    NewTrip(viewModel: tripVM)
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
                               
                                ForEach(tripVM.trips, id: \.self) { trip in
                                    
                                    TripCell(viewModel: tripVM, trip: trip)
                                        .padding(.top)
                                }
                                
                            }
                            
                            
                        }
                        
                       
                    }.padding(.horizontal).padding(.top, 30)
                    
                }
                Spacer()
                NavigationLink {
                    NewTrip(viewModel: tripVM)
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
            }.padding(.horizontal).padding(.bottom, 55)
            
//            NavigationLink(
//                destination: ContactsView(repairVM: repairVM).navigationBarBackButtonHidden(),
//                isActive: $goToContacts,
//                label: {
//                    EmptyView()
//                }
//            )
        }
    }
}

#Preview {
    TripsView(tripVM: TripsViewModel())
}
