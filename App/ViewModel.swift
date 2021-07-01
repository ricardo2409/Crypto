//
//  ViewModel.swift
//  App
//
//  Created by Ricardo Trevino on 6/29/21.
//

import Foundation

class ViewModel {
    func fetchCrypto(_ completion: @escaping (_ cryptos: [Crypto]) -> (Void)) {
        let repository = CryptoRepository()
        
        repository.fetchCrypto { cryptos in
            completion(cryptos)
        }
    }
    
}
