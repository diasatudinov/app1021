//
//  EditStopView.swift
//  app1021
//
//  Created by Dias Atudinov on 07.11.2024.
//

import SwiftUI

struct EditStopView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TripsViewModel
    @State var trip: Trip
    
    @State var name = ""
    @State var distance = ""
    @State var date = Date()
    @State private var userInput = ""
    
    @State private var dataPickerShow = false
    @State private var showAlert = false
    @State private var stops: [String] = []
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView(rightImage: "trash.fill", leftButton: {
                    
                    
                    presentationMode.wrappedValue.dismiss()
                    
                }, rightButton: {
                    viewModel.deleteTrip(trip)
                    presentationMode.wrappedValue.dismiss()
                    
                }, title: "Edit").padding(.bottom, 16)
                
                VStack {
                    FieldCell(name: "Place", bindText: $name, type: .default)
                    FieldCell(name: "Distance", bindText: $distance, type: .default)
                    HStack(spacing: 40) {
                        
                        Text("Date")
                            .foregroundColor(.white)
                        
                        Text("\(formattedDate(date))")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.yellowBtn)
                            .padding(.vertical, 6)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(6)
                            .onTapGesture {
                                dataPickerShow.toggle()
                            }
                        
                    }.padding(11).padding(.horizontal, 10).background(Color.secondaryBg).cornerRadius(13)
                    
                    HStack {
                        Text("Stops")
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                        Button {
                            showAlert = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 17, weight: .semibold))
                        }
                    }.foregroundColor(.black)
                    
                    if stops.isEmpty {
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 45) {
                                Image(systemName: "mappin")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .foregroundColor(.yellowBtn)
                                    .frame(height: 60)
                                
                                Text("No stops")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.yellowBtn)
                                    .lineSpacing(10)
                            }
                        }.frame(height: 139)
                    } else {
                        ForEach(stops, id: \.self) { replacement in
                            HStack {
                                Image(systemName: "mappin")
                                    .font(.system(size: 11, weight: .regular))
                                    .foregroundColor(.yellowBtn)
                                Text(replacement)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                                Button {
                                    if let index = stops.firstIndex(where: { $0 == replacement }) {
                                        withAnimation {
                                            stops.remove(at: index)
                                        }
                                    }
                                } label: {
                                    Image(systemName: "trash.fill")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                
                            }.padding().background(Color.secondaryBg).cornerRadius(9)
                        }
                    }
                    
                }.padding(.horizontal)
                Spacer()
                
                Button {
                    if !name.isEmpty {
                        
                        viewModel.editTrip(trip, name: name, distance: distance, date: date, replacements: stops)
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(13)
                            .foregroundColor(!name.isEmpty ? .yellowBtn : .secondaryBg)
                        
                        HStack(spacing: 25) {
                            
                            Text("Save")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(!name.isEmpty ? .secondaryBg : .white.opacity(0.16))
                                .lineSpacing(10)
                        }
                    }.frame(height: 45)
                }
            }.padding(.horizontal)
            
            if dataPickerShow {
                DatePicker("", selection: $date, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .background(Color.white.opacity(0.7)).cornerRadius(9)
                                .padding().shadow(radius: 10)
            }
            
            if showAlert {
                CustomAlert3(
                    viewModel: viewModel, isPresented: $showAlert,
                    text: $userInput, onConfirm: {
                        stops.append(userInput)
                    }
                    
                )
            }
        }.navigationBarBackButtonHidden()
            .onAppear {
                name = trip.name
                distance = trip.distance
                date = trip.date
                stops = trip.stops
            }
    }
    
    @ViewBuilder func FieldCell(name: String, bindText: Binding<String>, type: UIKeyboardType) -> some View {
        HStack(spacing: 40) {
            
            Text(name)
                .foregroundColor(.white)
            
            TextField(name, text: bindText)
                .keyboardType(type)
                .foregroundColor(.white)
            
        }.padding(11).padding(.horizontal, 10).background(Color.secondaryBg).cornerRadius(13)
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: date)
        
    }
}
#Preview {
    EditStopView(viewModel: TripsViewModel(), trip: Trip(name: "Los Angeles", distance: "7.500 km", date: Date(), stops: []))
}
