//
//  MockAPIServices.swift
//  MyShopTests
//
//  Created by Farendza Muda on 27/09/22.
//

import Foundation
@testable import MyShop

final class MockAPIServices: APIServicesProtocol {
    private let apiCall = URLSession.shared
    func fetchProducts(from endpoint: ProductEndPoint, completion: @escaping (Result<[Product], APICallError>) -> ()) {
        completion(.success(Product.sample))
    }
}
