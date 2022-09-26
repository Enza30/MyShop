//
//  Extension.swift
//  MyShop
//
//  Created by Farendza Muda on 22/09/22.
//

import Foundation
import SwiftUI

extension Bundle {
    func loadDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = url(forResource: filename, withExtension: ".json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        let decodeData = try jsonDecoder.decode(D.self, from: data)
        return decodeData
    }
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Color {
    static let cellColor: Color = Color("cellColor")
    static let backgroundColor: Color = Color("background")
}
