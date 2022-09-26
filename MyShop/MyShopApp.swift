//
//  MyShopApp.swift
//  MyShop
//
//  Created by Farendza Muda on 21/09/22.
//

import SwiftUI

@main
struct MyShopApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView(productList: ProductListVM())
            ProductList(products: Product.sample)
        }
    }
}
