//
//  NewMotorcycleView.swift
//  app1021
//
//  Created by Dias Atudinov on 30.10.2024.
//

import SwiftUI

struct NewMotorcycleView: View {
    
    @ObservedObject var motoVM: MotorcycleViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var selectedImage: UIImage?
    @State var brand = ""
    @State var model = ""
    @State var year = ""
    @State var mileag = ""
    @State var engine = ""
    @State var cylinde = ""
    @State var volume = ""
    @State private var isShowingImagePicker = false
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView(leftButton: {presentationMode.wrappedValue.dismiss()}, title: "Motorcycle").padding(.bottom, 25)
                
                Button {
                    isShowingImagePicker = true
                } label: {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .padding(.bottom)
                            .allowsHitTesting(false)
                    } else {
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(9)
                                .foregroundColor(.secondaryBg)
                            
                            
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.yellowBtn)
                            
                            
                        }.frame(height: 140).padding(.bottom)
                        
                    }
                }
                VStack(spacing: 7) {
                    
                    FieldCell(name: "Brand", bindText: $brand, type: .default)
                    
                    FieldCell(name: "Model", bindText: $model, type: .default)
                    
                    FieldCell(name: "Year", bindText: $year, type: .numberPad)
                    
                    FieldCell(name: "Mileage", bindText: $mileag, type: .numberPad)
                    
                    FieldCell(name: "Engine", bindText: $engine, type: .default)
                    
                    FieldCell(name: "Cylinders", bindText: $cylinde, type: .numberPad)
                    
                    FieldCell(name: "Volume", bindText: $volume, type: .default)
                    
                }.padding(.bottom)
                Spacer()
                Button {
                    if !brand.isEmpty && !model.isEmpty && !engine.isEmpty && !volume.isEmpty, let mileage = Int(mileag), let year = Int(year), let cylinders = Int(cylinde) {
                        
                        if let image = selectedImage {
                            let moto = Motorcycle(imageData: image.jpegData(compressionQuality: 1.0), brand: brand, model: model, year: year, mileage: mileage, engine: engine, cylinders: cylinders, volume: volume)
                            
                            motoVM.addMoto(moto)
                        } else {
                            let moto = Motorcycle(brand: brand, model: model, year: year, mileage: mileage, engine: engine, cylinders: cylinders, volume: volume)
                            motoVM.addMoto(moto)
                        }
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(13)
                            .foregroundColor(!brand.isEmpty && !model.isEmpty && !engine.isEmpty && !volume.isEmpty && !mileag.isEmpty && !year.isEmpty && !cylinde.isEmpty ? .yellowBtn : .secondaryBg)
                        
                        HStack(spacing: 25) {
                            
                            Text("Save")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(!brand.isEmpty && !model.isEmpty && !engine.isEmpty && !volume.isEmpty && !mileag.isEmpty && !year.isEmpty && !cylinde.isEmpty ? .secondaryBg : .white.opacity(0.16))
                                .lineSpacing(10)
                        }
                    }.frame(height: 45)
                }
                
                
                
                
                
                
                
                
            }.padding(.horizontal)
            
            
        }.sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
    }
    
    //MARK: -CloseEditHomeAlert View
    @ViewBuilder func FieldCell(name: String, bindText: Binding<String>, type: UIKeyboardType) -> some View {
        HStack(spacing: 40) {
            
            Text(name)
                .foregroundColor(.white)
            
            TextField(name, text: bindText)
                .keyboardType(type)
                .foregroundColor(.white)
            
        }.padding(11).padding(.horizontal, 10).background(Color.secondaryBg).cornerRadius(13)
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
}

#Preview {
    NewMotorcycleView(motoVM: MotorcycleViewModel())
}
