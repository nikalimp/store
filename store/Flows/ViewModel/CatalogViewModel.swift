//
//  CatalogViewModel.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        
        Product (id: "1",
                title: "Чиабатта",
                imageUrl: "Chiabatta",
                price: 450,
                description: "Вкусно очень"),
        
        Product (id: "2",
                title: "Чиабатта",
                imageUrl: "Chiabatta",
                price: 450,
                description: "Очень вкусно")
    ]
    
    var bread = [
        
        Product (id: "1",
                title: "Чиабатта",
                imageUrl: "Chiabatta",
                price: 450,
                description: "Вкусно очень"),
        
        Product (id: "2",
                title: "Чиабатта",
                imageUrl: "Chiabatta",
                price: 450,
                description: "Очень вкусно")
    ]
}
