//
//  UrlConstants.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 19/02/23.
//

import Foundation

class UrlConstants {
    
    static let urlObj = UrlConstants()
    

    // MARK: - Base url for fetching quotes
    #if DEBUG
    let baseURL: String = "https://quotes.rest/"
    #else
    let baseURL: String = ""
    #endif
    
    enum urlConstants: String {
        case getQod = "qod"
        case getCatQod = "qod.json?category="
    }

    func getUrl(urlString: urlConstants) -> String {
        return "\(baseURL)\(urlString.rawValue)"
    }
    
    
    
    
}
