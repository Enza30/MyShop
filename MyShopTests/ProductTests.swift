//
//  ProductTests.swift
//  MyShopTests
//
//  Created by Farendza Muda on 27/09/22.
//

import XCTest
@testable import MyShop

class ProductListVMTest: XCTestCase {
    var mockProductListVM: MockAPIServices!
    var product: ProductListVM!
    
    override func setUp() {
        mockProductListVM = MockAPIServices()
        product = .init(productServices: mockProductListVM)
    }
    
    func testLoadingProducts(){
        product.products = Product.sample
        XCTAssert(product.products != nil)
    }
    
    override func tearDown(){
        
    }
}
