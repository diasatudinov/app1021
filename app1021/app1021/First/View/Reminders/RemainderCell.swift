//
//  RemainderCell.swift
//  app1021
//
//  Created by Dias Atudinov on 05.11.2024.
//

import SwiftUI

struct RemainderCell: View {
    @ObservedObject var viewModel: RemindersViewModel
    @State var remainder: Reminder
    var body: some View {
        ZStack {
                
            VStack(spacing: 0) {
                HStack(spacing: 25) {
                    Text(remainder.name)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.yellowBtn)
                        .lineSpacing(10)
                    Spacer()
                    NavigationLink {
                        EditReminderView(viewModel: viewModel, remainder: remainder)
                    } label: {
                        Image(systemName: "pencil")
                            .font(.system(size: 17, weight: .medium))
                    }
                }
                
                Rectangle()
                    .frame(height: 5)
                    .foregroundColor(.white.opacity(0.12))
                    .padding(.top, 4).padding(.bottom, 15)
                HStack {
                    Text("Replacement")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.3))
                    Spacer()
                }.padding(.bottom, 5)
                VStack(spacing: 5) {
                    ForEach(remainder.replacements.prefix(5), id: \.self) { accessory in
                        
                        HStack {
                            Image(systemName: "book.and.wrench.fill")
                                .font(.system(size: 11, weight: .regular))
                                .foregroundColor(.yellowBtn)
                            Text(accessory)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                        }
                        
                    }
                }.padding(.bottom, 15)
                
                Text("\(formattedDate(remainder.date))")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.yellowBtn)
                    .padding(.vertical, 6)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.12))
                    .cornerRadius(6)
                
            }.foregroundColor(.white).padding(.horizontal).padding(.vertical)
        }.background(Color.secondaryBg).cornerRadius(9)
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: date)
        
    }
}

#Preview {
    RemainderCell(viewModel: RemindersViewModel(), remainder: Reminder(name: "Tyre replacement", date: Date(), replacements: ["Discs", "Chain "]))
}
