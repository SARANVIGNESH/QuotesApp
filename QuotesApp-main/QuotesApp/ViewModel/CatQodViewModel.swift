//
//  CatQodViewModel.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 18/02/23.
//

import Foundation


class CatQodViewModel {
    
    // MARK: - Variable for storing category qod
    var catQod: CatQod?
    
    // MARK: - Variable for storing selected category
    let userDefault = UserDefaults.standard
    
    // MARK: - Api for fetching category qod
    func apiToGetCatQod(completion : @escaping (CatQod?, Error?) -> ()) {
        if let catName = userDefault.string(forKey: "selectedCat") {
            print("the catName is \(catName.lowercased())")
            NetworkManager.shared.get(urlString: UrlConstants().getUrl(urlString: .getCatQod)+"\(catName.lowercased())") { data, response, error in
                let decoder = JSONDecoder()
                do {
                    self.catQod = try! decoder.decode(CatQod.self, from: data!)
                    completion(self.catQod,nil)
                }
            }
        }
        
    }
    
    
    
}
