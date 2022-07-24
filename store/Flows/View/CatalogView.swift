//
//  CatalogView.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Популярное") {
                
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 12) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            
                            NavigationLink{
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            }
                                label: {
                                ProductCell(product: item)
                                .foregroundColor(.black)
                                }
                            
                        }
                    }.padding()
                }
            }

            
        }.navigationTitle(Text("Каталог"))
        
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
