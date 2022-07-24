//
//  ProductCell.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            Image("Chiabatta")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 100)
                .clipped()
                .cornerRadius(4)
            HStack{
                Text(product.title)
                    .font(.custom("Helvetica Neue", size: 18))
                Spacer()
                Text("\(product.price) рублей")
                    .font(.custom("Helvetica Neue", size: 14))
            }
        }.frame(width: 200, height: 200)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "Чиабатта",
                                     imageUrl: "Chiabatta",
                                     price: 450,
                                     description: "5"))
    }
}
