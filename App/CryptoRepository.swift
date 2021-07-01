//
//  CryptoRepository.swift
//  App
//
//  Created by Ricardo Trevino on 6/29/21.
//

import Foundation
import Alamofire

class CryptoRepository {
    
    func fetchCrypto(_ completion: @escaping (_ cryptos: [Crypto]) -> (Void)) {
        
        let URL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false"

        AF.request(URL).responseDecodable(of: [Crypto].self) { response in
            guard let cryptos = response.value else { return }
            
            completion(cryptos)
        }
    }
}



