//
//  QodViewModel.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import Foundation

class QodViewModel {
    
    
    // MARK: - Variable for storing qod data
    var qodData: Qod?
    
    // MARK: - Api for fetching qod
    func apiToGetQod(completion : @escaping (Qod?, Error?) -> ()) {
        NetworkManager.shared.get(urlString: UrlConstants().getUrl(urlString: .getQod)) { data, res, err in
            let decoder = JSONDecoder()
            do {
                self.qodData = try! decoder.decode(Qod.self, from: data!)
                completion(self.qodData,nil)
            }
        }

    }
}
