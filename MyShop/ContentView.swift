//
//  ContentView.swift
//  MyShop
//
//  Created by Farendza Muda on 21/09/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var productList: ProductListVM
    @State var pickedCategory: ProductEndPoint = .all
    var body: some View {
        NavigationView{
            ZStack{
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical){
                    VStack(alignment: .center){
                        CategoryPicker(choosenCategory: $pickedCategory)
                            .onChange(of: pickedCategory, perform: { value in
                                DispatchQueue.main.async {
                                    productList.loadProducts(with: pickedCategory)
                                }
                            })
                        if productList.products != nil {
                            ProductList(products: productList.products!)
                        } else {
                            LoadingView(isLoading: productList.isLoading, error: productList.error){
                                productList.loadProducts(with: pickedCategory)
                            }
                        }
                    }
                    Spacer(minLength: 40)
                }
            }
            .navigationTitle("MyShop")
            .navigationBarTitleDisplayMode(.large)
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(productList: ProductListVM())
    }
}
