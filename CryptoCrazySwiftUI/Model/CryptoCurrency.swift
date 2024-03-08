//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Hüseyin Özen Albayrak on 6.09.2023.
//

import Foundation

struct CryptoCurrency: Hashable ,Decodable, Identifiable {
    let id = UUID()
    let currency, price: String
    
    private enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
