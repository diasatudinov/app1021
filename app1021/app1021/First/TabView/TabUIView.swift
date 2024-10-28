//
//  TabUIView.swift
//  app1021
//
//  Created by Dias Atudinov on 28.10.2024.
//

import SwiftUI

struct TabUIView: View {
    @State var selectedTab = 0
    private let tabs = ["Home", "Attractions", "Memories"]
    
//    @ObservedObject var collectionVM = CollectionViewModel()
//    @ObservedObject var settingsVM = SettingsViewModel()
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case 0:
                Text("1")
                //HomeUIView(viewModel: collectionVM)
            case 1:
                Text("2")
                //MyCollectionUIView(viewModel: collectionVM)
            case 2:
                Text("3")
                //PlannedUIView(viewModel: collectionVM)
            default:
                Text("default")
            }
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.secondaryBg)
                            .frame(height: 83)
                            
                        HStack(spacing: 100) {
                            ForEach(0..<tabs.count) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    
                                    ZStack {
                                        VStack {
                                            if index == 0 {
                                                Image(icon(for: index))
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .scaledToFit()
                                                    .frame(height: 28)
                                                    .foregroundColor(selectedTab == index ? Color.yellowBtn : Color.white.opacity(0.7))
                                                    .font(.system(size: 20, weight: .semibold))
                                                    .padding(.bottom, 2)
                                            } else {
                                                Image(systemName: icon(for: index))
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 28)
                                                    .foregroundColor(selectedTab == index ? Color.yellowBtn : Color.white.opacity(0.7))
                                                    .font(.system(size: 20, weight: .semibold))
                                                    .padding(.bottom, 2)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }.padding(.bottom, 5)
                    
                    }
                    
                }.ignoresSafeArea()
            
        }
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "tab1"
        case 1: return "book.and.wrench.fill"
        case 2: return "map.fill"
        default: return ""
        }
    }
    
    private func text(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "My collection"
        case 2: return "Planned"
        default: return ""
        }
    }
}

#Preview {
    TabUIView()
}
