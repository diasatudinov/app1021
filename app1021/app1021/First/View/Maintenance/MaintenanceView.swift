//
//  MaintenanceView.swift
//  app1021
//
//  Created by Dias Atudinov on 04.11.2024.
//

import SwiftUI

struct MaintenanceView: View {
    @ObservedObject var viewModel: MaintenanceViewModel
    @State private var showAlert = false
    @State private var userInput = ""
    @State private var alertText = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView(leftButton: {presentationMode.wrappedValue.dismiss()},title: "Maintenance").padding(.bottom, 16)
                
                
                VStack {
                    
                    HStack {
                        Text("Accessories")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                        Spacer()
                        Button {
                            showAlert = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black)
                        }
                    }
                    if viewModel.accessories.isEmpty {
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 45) {
                                Image(systemName: "book.and.wrench.fill")
                                    .font(.system(size: 55, weight: .regular))
                                    .foregroundColor(.yellowBtn)
                                
                                Text("No accessories")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.yellowBtn)
                                    .lineSpacing(10)
                            }
                        }.frame(height: 139)
                    } else {
                        ForEach($viewModel.accessories, id: \.self) { $accessory in
                            
//                            FieldCell(name: accessory.name, bindText: accessory.state, type: .default)
                            HStack {
                                FieldCell(name: accessory.name, bindText: $accessory.state, type: .default)
                            
                                Button {
                                    viewModel.deleteAccessory(accessory)
                                } label: {
                                    Image(systemName: "trash.fill")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.secondaryBg)
                                }
                            }
                            
                        }
                    }
                }.padding(.horizontal)
                Spacer()
            }.padding(.horizontal)
            
            if showAlert {
                CustomAlert(
                    viewModel: viewModel, isPresented: $showAlert,
                    text: $userInput,
                    onConfirm: {
                        alertText = userInput
                        
                    }
                )
            }
            
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
}

#Preview {
    MaintenanceView(viewModel: MaintenanceViewModel())
}


struct CustomAlert: View {
    @ObservedObject var viewModel: MaintenanceViewModel
    @Binding var isPresented: Bool
    @Binding var text: String
    var onConfirm: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Accessories")
                .font(.headline)
            
            TextField("Type something...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            VStack(spacing: 0) {
            Rectangle()
                .frame(height: 0.5)
                .padding(.horizontal, -16)
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                Button("Cancel") {
                    isPresented = false
                    text = ""
                }
                .foregroundColor(.black.opacity(0.6))
                Spacer()
                Rectangle()
                    .frame(width: 0.5, height: 44)
                    
                Spacer()
                Button("Add") {
                    onConfirm()
                    viewModel.addAccessory(Accessory(name: text))
                    isPresented = false
                    text = ""
                    print(viewModel.accessories)
                }
                .foregroundColor(.black)
                Spacer()
            }
        }.padding(.vertical, -16)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(23)
        .shadow(radius: 10)
        .frame(maxWidth: 300)
    }
}
