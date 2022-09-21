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
    var urlImage: String
    var rate: Rate
}

struct Rate: Codable, Hashable {
    let rating: Double
    let countRate: Int = Int.random(in: 0...500)
}

extension Product {
    var URLImage: URL {
        URL(string: urlImage)!
    }
    var rateFormatting: String {
        var result = ""
        for _ in 0...Int(rate.rating){
            result.append("★")
        }
        while result.count<5 {
            result += "☆"
        }
        return result
    }
}
