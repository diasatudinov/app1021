//
//  MotoView.swift
//  app1021
//
//  Created by Dias Atudinov on 30.10.2024.
//

import SwiftUI

struct MotoView: View {
    @ObservedObject var motoVM: MotorcycleViewModel
    @State var goToSettings = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView(rightImage: "gear", leftButton: nil, rightButton: { goToSettings = true }, title: "Motorcycle").padding(.bottom)
                
                if let motorcycle = motoVM.motorcycle {
                    
                    VStack(spacing: 16) {
                        if let image = motorcycle.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 140)
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                                .padding(.bottom)
                                .allowsHitTesting(false)
                        } else {
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(9)
                                    .foregroundColor(.secondaryBg)
                                
                                HStack(spacing: 25) {
                                    Image(.tab1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 60)
                                    
                                    Text("Add information  your motorcycle")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.yellowBtn)
                                        .lineSpacing(10)
                                }
                            }.frame(height: 139)
                            
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 25) {
                                Image(.tab1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 32)
                                VStack(alignment: .leading) {
                                    Text(motorcycle.brand)
                                        .font(.system(size: 28, weight: .regular))
                                        .foregroundColor(.white)
                                    Text(motorcycle.model)
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                            }.padding()
                        }.frame(height: 91)
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 25) {
                                Image(systemName: "oilcan.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 25)
                                    .foregroundColor(.yellowBtn)
                                VStack(alignment: .leading) {
                                    Text("\(motorcycle.year)")
                                        .font(.system(size: 28, weight: .regular))
                                        .foregroundColor(.white)
                                    Text("\(motorcycle.mileage) km")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                            }.padding()
                        }.frame(height: 91)
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 25) {
                                Image(systemName: "engine.combustion.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 25)
                                    .foregroundColor(.yellowBtn)
                                VStack(alignment: .leading) {
                                    Text(motorcycle.engine)
                                        .font(.system(size: 28, weight: .regular))
                                        .foregroundColor(.white)
                                    HStack {
                                        Text("\(motorcycle.cylinders) cyl")
                                            .font(.system(size: 17, weight: .regular))
                                            .foregroundColor(.white)
                                        Text(motorcycle.volume + " vol")
                                            .font(.system(size: 17, weight: .regular))
                                            .foregroundColor(.white)
                                    }
                                }
                                Spacer()
                            }.padding()
                        }.frame(height: 91)
                    }
                } else {
                    VStack(spacing: 16) {
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            HStack(spacing: 25) {
                                Image(.tab1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 60)
                                
                                Text("Add information  your motorcycle")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.yellowBtn)
                                    .lineSpacing(10)
                            }
                        }.frame(height: 139)
                        
                        NavigationLink {
                            NewMotorcycleView(motoVM: motoVM)
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
                        
                    }.padding(.top)
                    
                    
                }
                
                Spacer()
                
            }.padding(.horizontal)
            
            NavigationLink(
                destination: SettingsView().navigationBarBackButtonHidden(),
                isActive: $goToSettings,
                label: {
                    EmptyView()
                }
            )
        }
    }
    
}

#Preview {
    MotoView(motoVM: MotorcycleViewModel())
}
