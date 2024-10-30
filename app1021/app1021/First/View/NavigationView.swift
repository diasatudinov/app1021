//
//  NavigationView.swift
//  app1021
//
//  Created by Dias Atudinov on 30.10.2024.
//

import SwiftUI

struct NavigationBarView: View {
    
    var rightImage: String?
    var leftButton: (() -> ())?
    var rightButton: (() -> ())?
    
    var title: String
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack(alignment: .center) {
                
                HStack(alignment: .center)  {
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)
                }
                
                HStack(alignment: .center)  {
                    if let leftButton = leftButton {
                        Button {
                            leftButton()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    if let rightButton = rightButton {
                        Button {
                            rightButton()
                        } label: {
                            Image(systemName: rightImage ?? "")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            Spacer()
            Rectangle()
                .frame(height: 0.33)
                .padding(.horizontal, -16)
                
        }.frame(height: 44)
    }
}

#Preview {
    NavigationBarView(rightImage: "gear", leftButton: {}, rightButton: {}, title: "Motorcycle")
}
