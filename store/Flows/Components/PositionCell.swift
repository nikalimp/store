//
//  PositionCell.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import SwiftUI

struct PositionCell: View {

    let position: Position

    var body: some View {
        HStack {
            Text(position.product.title)
                .font(.title2)
            Spacer()
            Text("\(position.count) штук")
            Text("\(position.cost) рублей")
        }.padding()
    }
}


struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(
            position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString,
                                                                       title: "2",
                                                                       imageUrl: "Chabatta",
                                                                       price: 450,
                                                                       description: "123"),
            count:1
            ))
    }}

