//
//  Crypto.swift
//  App
//
//  Created by Ricardo Trevino on 6/29/21.
//

import Foundation
import ObjectMapper

class Crypto: Decodable {
    var id: String
    var price: Float
    var image: String
    var market_cap: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case price = "current_price"
        case image
        case market_cap
    }
}
