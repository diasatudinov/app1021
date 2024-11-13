//
//  ContentView.swift
//  app1021
//
//  Created by Dias Atudinov on 28.10.2024.
//

import SwiftUI

struct ContentView: View {
    // Массив для хранения запчастей
    @State private var parts: [Part] = []
    @State private var newPartName: String = ""
    
    var body: some View {
        VStack {
            // Поле для добавления названия новой запчасти
            HStack {
                TextField("Введите название запчасти", text: $newPartName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Кнопка добавления новой запчасти
                Button(action: {
                    addPart()
                    print(parts)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .disabled(newPartName.isEmpty) // Отключить кнопку, если поле пустое
            }
            .padding()
            
            // Список добавленных запчастей
            List {
                ForEach($parts) { $part in
                    HStack {
                        Text(part.name) // Название запчасти
                        Spacer()
                        TextField("Введите состояние", text: $part.condition) // Поле для ввода состояния
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 150)
                    }
                    .padding(.vertical, 5)
                }
                .onDelete(perform: removePart) // Удаление запчасти
            }
        }
        .navigationTitle("Запчасти")
    }
    
    // Функция для добавления запчасти
    func addPart() {
        let part = Part(name: newPartName, condition: "")
        parts.append(part)
        newPartName = ""
    }
    
    // Функция для удаления запчасти
    func removePart(at offsets: IndexSet) {
        parts.remove(atOffsets: offsets)
    }
}

// Модель для запчасти
struct Part: Identifiable {
    let id = UUID()
    var name: String
    var condition: String
}

#Preview {
    ContentView()
}
