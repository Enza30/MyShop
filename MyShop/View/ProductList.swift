//
//  ProductList.swift
//  MyShop
//
//  Created by Farendza Muda on 23/09/22.
//

import SwiftUI

struct ProductList: View {
    let products: [Product]
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    @State private var product: Product? = nil
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(products){product in
                VStack{
                    Button(action:{self.product = product}){
                        ProductItem(product: product)
                    }
                }.background(Color.backgroundColor
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 2, x: 0.0, y: 0.0))
            }
        }.sheet(item: $product) { product in
            ProductDetail(product: product)
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProductList(products: Product.sample)
        }
    }
}
