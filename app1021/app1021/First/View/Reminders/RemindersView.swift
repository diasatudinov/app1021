//
//  RemindersView.swift
//  app1021
//
//  Created by Dias Atudinov on 05.11.2024.
//

import SwiftUI

struct RemindersView: View {
    @ObservedObject var viewModel: RemindersViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var goToNewReminder = false
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView(rightImage: "plus", leftButton: {presentationMode.wrappedValue.dismiss()}, rightButton: {goToNewReminder = true},title: "Reminders").padding(.bottom, 16)
                
                if viewModel.remainders.isEmpty {
                    ZStack {
                        Rectangle()
                            .cornerRadius(9)
                            .foregroundColor(.secondaryBg)
                        
                        VStack {
                            HStack(spacing: 45) {
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 55, weight: .regular))
                                    .foregroundColor(.yellowBtn)
                                
                                Text("No entries")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.yellowBtn)
                                    .lineSpacing(10)
                            }
                            Rectangle()
                                .frame(height: 5)
                                .padding(.horizontal)
                                .foregroundColor(.white.opacity(0.16))
                        }
                        
                    }.frame(height: 139)
                } else {
                    VStack {
                        ForEach(viewModel.remainders, id: \.self) { remainder in
                            RemainderCell(viewModel: viewModel, remainder: remainder)
                            
                        }
                    }
                }
                
                Spacer()
            }.padding(.horizontal)
            
            NavigationLink(
                destination: NewRemainderView(viewModel: viewModel).navigationBarBackButtonHidden(),
                isActive: $goToNewReminder,
                label: {
                    EmptyView()
                }
            )
        }
    }
}

#Preview {
    RemindersView(viewModel: RemindersViewModel())
}
