//
//  ProductModel.swift
//  MyShop
//
//  Created by Farendza Muda on 21/09/22.
//

import Foundation

struct Product: Identifiable, Codable, Hashable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rate
}

struct Rate: Codable, Hashable {
    let rate: Double
    let countRate: Int = Int.random(in: 0...500)
}

extension Product {
    var URLImage: URL {
        URL(string: image)!
    }
//    var rateFormatting: String {
//        var result = ""
//        for _ in 0...Int(rating.rate){
//            result.append("★")
//        }
//        while result.count<5 {
//            result += "☆"
//        }
//        return result
//    }
}

extension Product {
    static var sample: [Product] {
        let response: [Product]? = try? Bundle.main.loadDecodeJSON(filename: "products")
        return response ?? [Product(id: 1, title: "noproduct", price: 9.5, description: "noproduct", category: "noproduct", image: "noproduct", rating: Rate(rate: 9.5))]
    }
}
