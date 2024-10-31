//
//  ContactCell.swift
//  app1021
//
//  Created by Dias Atudinov on 31.10.2024.
//

import SwiftUI

struct ContactCell: View {
    
    @State var contact: Contact
    
    var onDelete: () -> ()
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(9)
                .foregroundColor(.secondaryBg)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.yellowBtn)
                    
                    Text(contact.name)
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(.white)
                        .lineSpacing(10)
                }
                
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.yellowBtn)
                    
                    Text(contact.employeeName)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.white)
                        .lineSpacing(10)
                }
                
                HStack {
                    Image(systemName: "phone.fill")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.yellowBtn)
                    
                    Text(contact.number)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.white)
                        .lineSpacing(10)
                    Spacer()
                    Button {
                        onDelete()
                    } label: {
                        Image(systemName: "trash.fill")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.white)
                    }
                }
            }.padding(.horizontal)
        }.frame(height: 139)
    }
}

#Preview {
    ContactCell(contact: Contact(name: "Technical inspection", employeeName: "Migel", number: "+12345678900"), onDelete: {})
}
