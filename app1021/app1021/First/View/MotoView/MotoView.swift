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
    //presentationMode.wrappedValue.dismiss()
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView(rightImage: "gear", leftButton: nil, rightButton: { goToSettings = true }, title: "Motorcycle")
                
                if let motorcycle = motoVM.motorcycle {
                    
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
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
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
