//
//  TabBar.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        TabView {
        NavigationView{
        CatalogView()
                .tabItem{
                    VStack{
                        Image(systemName: "menucard")
                        Text("Каталог")
                    }
                }
            }
            CartView(viewModel: CartViewModel.shared)
                .tabItem{
                    VStack{
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }
        ProfileView()
                .tabItem{
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Профиль")
                        }
                    }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
