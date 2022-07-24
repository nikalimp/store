//
//  Position.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import Foundation

struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    var cost: Int {
        return product.price * self.count
    }

}
