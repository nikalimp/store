//
//  ProductDetailView.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import SwiftUI

struct ProductDetailView: View {
        
    var viewModel: ProductDetailViewModel
    @State var size = "Маленькая"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack{
        VStack(alignment: .leading){
            Image("Chiabatta")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 280)
            HStack {
                Text("\(viewModel.product.title)").font(.title2.bold())
                Spacer()
                Text("\(viewModel.getPrice(size: self.size))").font(.title3)
            }.padding(.horizontal)
            
            Text("\(viewModel.product.description)")
                .padding(.horizontal)
            
            HStack {
                Stepper("Количество", value: $count, in: 1...10)
                Text("\(self.count)")
            }.padding(.horizontal)
            
            Picker("Размер", selection: $size) {
                ForEach(viewModel.sizes, id: \.self) { item in
                    Text(item)
                }
            }.pickerStyle(.segmented).padding(.horizontal)
        }
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                
                position.product.price = viewModel.getPrice(size: size)
                
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Text("Добавить в корзину")
                    .padding()
                    .background(.blue)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .font(.body.bold())
            }
            
            Spacer()
            
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                             title: "Чиабатта",
                                                                             imageUrl: "Chiabatta",
                                                                             price: 450,
                                                                             description: "5")))
    }
}
