//
//  QuotesCategoryViewModel.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import Foundation

class QuotesCategoryViewModel {
    
    // MARK: - Variable for storing quotes categories
    var quotesCat: QuoteCategory?
    
    // MARK: - Api for fetching quotes categories
//    func apiToGetCat(completion : @escaping (QuoteCategory?, Error?) -> ()) {
//        NetworkManager.shared.get(urlString: "https://quotes.rest/qod/categories") { [weak self] result in
//               guard self != nil else { return }
//                    switch result {
//                    case .failure(let error):
//                        print(error)
//                    case .success(let response):
//                        let decoder = JSONDecoder()
//                        do {
//                            print("the response is \(response)")
//                            self?.quotesCat = try! decoder.decode(QuoteCategory.self, from: response)
//                            completion(self?.quotesCat,nil)
//                        }
//                    }
//                }
//    }
    
    
}
