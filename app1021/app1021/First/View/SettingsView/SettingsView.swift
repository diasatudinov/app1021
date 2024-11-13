//
//  SettingsView.swift
//  app1021
//
//  Created by Dias Atudinov on 30.10.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView(leftButton: {presentationMode.wrappedValue.dismiss()}, title: "Settings").padding(.bottom, 25)
                
                VStack(spacing: 16) {
                    Button {
                        rateApp()
                    } label: {
                        ButtonCell(title: "Rate App")
                    }
                    
                    Button {
                        shareApp()
                    } label: {
                        ButtonCell(title: "Share App")
                    }
                    
                    Button {
                        openUsagePolicy()
                    } label: {
                        ButtonCell(title: "Usage Policy")
                    }
                }
                
                Spacer()
            }.padding(.horizontal)
        }
    }
    
    @ViewBuilder func ButtonCell(title: String) -> some View {
        HStack(spacing: 40) {
            
            Text(title)
                .foregroundColor(.secondaryBg)
            
            
            
        }.padding(12).frame(maxWidth: .infinity).background(Color.yellowBtn).cornerRadius(13)
    }
    
    func shareApp() {
        guard let url = URL(string: "https://itunes.apple.com/app/id6737912810") else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
    func openUsagePolicy() {
        guard let url = URL(string: "https://www.termsfeed.com/live/037a13df-19f8-46de-82ae-db8ea192d5ff") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    SettingsView()
}
