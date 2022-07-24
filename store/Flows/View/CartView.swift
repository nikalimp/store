//
//  CartView.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions{
                        Button{
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }.tint(.red)
                    }
            }.listStyle(.plain)
            .navigationTitle("Корзина")
        
        HStack{
            Text("ИТОГО:").font(.title2)
            Spacer()
            Text("\(self.viewModel.cost) рублей").font(.title2)
        }.padding()
            
            HStack{
                
                Button {
                    print("Отменить")
                } label: {
                    Text("Отменить")
                }.padding().background(.red).foregroundColor(.white).cornerRadius(30)
                
                Spacer()
                
                Button {
                    print("Заказать")
                } label: {
                    Text("Заказать")
                }.padding().background(.green).foregroundColor(.white).cornerRadius(30)
                
            }.padding()
            
    }
}
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
