//
//  ReOnboardingUIView.swift
//  app1021
//
//  Created by Dias Atudinov on 28.10.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                switch pageNum {
                case 1: Image(.firstBg)
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height)
                        .ignoresSafeArea()
                    
                case 2: Image(.secondBg)
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height)
                        .ignoresSafeArea()
                    
                case 3: Image(.thirdBg)
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height)
                        .ignoresSafeArea()
                    
                    
                default:
                    Image(.firstBg)
                            .resizable()
                            .scaledToFill()
                            .frame(height: UIScreen.main.bounds.height)
                            .ignoresSafeArea()
                }
                
                VStack {
                    Spacer()
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .bottom)
                        .frame(height: UIScreen.main.bounds.height / 5.6)
                        .cornerRadius(20)
                }
                
                VStack(spacing: 0) {
                    
                    switch pageNum {
                    case 1:
                        VStack(spacing: 12) {
                            Text("Keep a technical diary of your motorcycle")
                                .font(.system(size: 34, weight: .bold))
                                .multilineTextAlignment(.center)
                            
                        }.frame(height: 100).padding(.horizontal, 0).foregroundColor(.black).padding(.top, 40)
                    case 2:
                        VStack(spacing: 12) {
                            Text("Record the status of \ncomponents")
                                .font(.system(size: 34, weight: .bold))
                                .multilineTextAlignment(.center)
                            
                        }.frame(height: 100).padding(.horizontal, 0).foregroundColor(.black).padding(.top, 40)
                        
                    case 3:
                        VStack(spacing: 12) {
                            Text("Don't forget about \nmaintenance")
                                .font(.system(size: 34, weight: .bold))
                                .multilineTextAlignment(.center)
                            
                        }.frame(height: 100).padding(.horizontal, 0).foregroundColor(.black).padding(.top, 40)
                    default:
                        Text("Save information about \nyour favorite routes")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
                    }
                    
                    switch pageNum {
                    case 1: Image("app1021Screen1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height / 1.3)
                        
                        
                    case 2: Image("app1021Screen2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height / 1.3)
                        
                    case 3: Image("app1021Screen3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height / 1.3)
                    default:
                        Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    }
                }.padding(.bottom)
                VStack {
                    Spacer()
                        
                        Button {
                            if pageNum < 3 {
                                pageNum += 1
                            } else {
                                signedUP = true
                            }
                        } label: {
                            Text("Next")
                                .foregroundColor(Color.black)
                                .font(.system(size: 17))
                                .padding()
                                .frame(maxWidth: .infinity)
                        }.frame(height: 50).background(Color.yellowBtn)
                            .cornerRadius(16).padding(.horizontal).padding(.bottom, 24)
                        
                        HStack(spacing: 8) {
                            Circle()
                                .fill(pageNum == 1 ? Color.yellowBtn : Color.gray.opacity(0.5))
                                .frame(width: 10, height: 10)
                                .cornerRadius(19)
                            
                            Circle()
                                .fill(pageNum == 2 ? Color.yellowBtn : Color.gray.opacity(0.5))
                                .frame(width: 10, height: 10)
                                .cornerRadius(19)
                            
                            Circle()
                                .fill(pageNum == 3 ? Color.yellowBtn : Color.gray.opacity(0.5))
                                .frame(width: 10, height: 10)
                                .cornerRadius(19)
                            
                        }.padding(.bottom, 40)
                        
                    
                }
            }
            
        } else {
            TabUIView()
        }
    }
}

#Preview {
    ReOnboardingUIView()
}
