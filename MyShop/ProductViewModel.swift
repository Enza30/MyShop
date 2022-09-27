//
//  ProductViewModel.swift
//  MyShop
//
//  Created by Farendza Muda on 23/09/22.
//

import Foundation

class ProductListVM: ObservableObject {
    @Published var products: [Product]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    var featuredProduct : [Product] {
        var productFeatured: [Product] = []
        if let products = self.products {
            if products.count >= 4 {
                productFeatured = products[0...3].shuffled()
            }
        }
        return productFeatured
    }
    
    
    private let productListServices: APIServicesProtocol
    
    init(productServices: APIServicesProtocol = APIServices.shared){
        self.productListServices = productServices
    }
    
    func loadProducts(with url: ProductEndPoint){
        self.products = nil
        DispatchQueue.main.async {
            self.isLoading = true
        }
        productListServices.fetchProducts(from: url) { (result) in
            DispatchQueue.main.async {
                self.isLoading = true
            }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error as NSError
                    print(error.localizedDescription)
                }
            }
        }
    }
}
