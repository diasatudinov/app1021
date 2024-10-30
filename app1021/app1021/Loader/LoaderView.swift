//
//  LoaderView.swift
//  app1021
//
//  Created by Dias Atudinov on 28.10.2024.
//

import SwiftUI

struct LoaderView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    
    var body: some View {
        if isLoadingView {
            ZStack {
                Image("onboardingBg")
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Spacer()
                    Spacer()
                    
                    ZStack {
                        VStack(spacing: 20) {
                            Text("Mel Motor")
                                .font(.custom("Audiowide-Regular", size: 50))
                            HStack {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .labelSecondary))
                                    .scaleEffect(x: 1.7, y: 1.7, anchor: .center)
                                Text("Status...")
                                    .foregroundColor(.labelSecondary.opacity(0.6))
                                    .padding()
                                
                            }
                        }
                    }
                    .foregroundColor(.black)
                    .padding(14)
                    .padding(.bottom, 60)
                }
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            if true {
                ReOnboardingUIView()
                
            } else {
                UsOnboardingUIView()
            }
            
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
}

#Preview {
    LoaderView()
}
