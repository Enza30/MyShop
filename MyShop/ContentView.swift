//
//  ContentView.swift
//  MyShop
//
//  Created by Farendza Muda on 21/09/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var productList: ProductListVM
    var body: some View {
        VStack(alignment: .center){
            if productList.products != nil {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(productList: ProductListVM())
    }
}
