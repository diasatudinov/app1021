//
//  UsOnboardingUIView.swift
//  app1021
//
//  Created by Dias Atudinov on 28.10.2024.
//

import SwiftUI
import StoreKit

struct UsOnboardingUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isNotificationView: Bool = true
    @State private var pageNum: Int = 1
    @AppStorage("onboardingShowed") var onboardingShowed: Bool = false
    
    var body: some View {
        if !onboardingShowed {
            if pageNum < 3 {
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    
                    switch pageNum {
                    case 1:
                        
                        Image("screen1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height)
                        
                    case 2: Image("screen2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height)
                    default:
                        Image("screen3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 500)
                            .ignoresSafeArea()
                    }
                  
                        VStack {
                            ZStack {
                                VStack {
                                    Spacer()
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(height: 120)
                                            .cornerRadius(20)
                                        
                                        Button {
                                            if pageNum < 3 {
                                                pageNum += 1
                                            } else {
                                            }
                                        } label: {
                                            Text("Next")
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 17))
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                        }.frame(height: 50).background(Color.yellowBtn)
                                            .cornerRadius(16).padding(.horizontal)
                                    }
                                }.edgesIgnoringSafeArea(.bottom)
                                VStack {
                                    
                                    switch pageNum {
                                    case 1:
                                        VStack(spacing: 0) {
                                            Text("The best solution for sports betting")
                                                .font(.system(size: 34, weight: .bold))
                                                .multilineTextAlignment(.center)
                                        }.frame(height: 160).foregroundColor(.black)
                                        
                                    case 2:
                                        VStack(spacing: 0) {
                                            Text("Manage your personal \nfinances")
                                                .font(.system(size: 34, weight: .bold))
                                                .multilineTextAlignment(.center)
                                        }.frame(height: 160).foregroundColor(.black)
                                            .onAppear{
                                                rateApp()
                                            }
                                    default:
                                        Text("Don’t miss anything")
                                            .font(.title)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.black)
                                            .padding(.bottom, 10)
                                        Text("Don’t miss the most userful information")
                                            .foregroundColor(.white).opacity(0.7)
                                        
                                    }
                                    HStack(spacing: 8) {
                                        Circle()
                                            .fill(pageNum == 1 ? Color.yellowBtn : Color.gray.opacity(0.5))
                                            .frame(width: 8, height: 8)
                                            .cornerRadius(19)
                                        
                                        Circle()
                                            .fill(pageNum == 2 ? Color.yellowBtn : Color.gray.opacity(0.5))
                                            .frame(width: 8, height: 8)
                                            .cornerRadius(19)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    
                                    
                                    
                                }
                                
                            }
                        }
                    
                    
                }
            } else {
                if isNotificationView {
                    ZStack {
                        Color.white
                            .ignoresSafeArea()
                        
                        Image("screen3")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height)
                        ZStack {
                            
                            
                            VStack(spacing: 0) {
                                ZStack {
                                    VStack {
                                        Spacer()
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.black)
                                                .frame(height: 120)
                                                .cornerRadius(20)
                                            
                                            Button {
                                                isNotificationView = false
                                                onboardingShowed = true
                                            } label: {
                                                
                                                Text("Next")
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 17))
                                                    .padding()
                                                    .frame(maxWidth: .infinity)
                                            }.frame(height: 50).background(Color.yellowBtn)
                                                .cornerRadius(16).padding(.horizontal)
                                        }
                                    }.edgesIgnoringSafeArea(.bottom)
                                    
                                    VStack {
                                        VStack(spacing: 12) {
                                            Text("Don’t miss anything")
                                                .font(.system(size: 34, weight: .bold))
                                                .multilineTextAlignment(.center)
                                           
                                        }.frame(height: 160).foregroundColor(.black)
                                        
                                        
                                        
                                        Spacer()
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                } else {
                    //WUIView()
                }
            }
        } else {
            //WUIView()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}

#Preview {
    UsOnboardingUIView()
}
