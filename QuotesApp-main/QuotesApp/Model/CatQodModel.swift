//
//  CatQodModel.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 18/02/23.
//

import Foundation


// MARK: - CatQod
struct CatQod: Decodable {
    let success: QodSuccess
    let contents: QodContents
    let baseurl: String
    let copyright: QodCopyright
}

// MARK: - Contents
struct QodContents: Decodable {
    let quotes: [QodQuote]
}

// MARK: - Quote
struct QodQuote: Decodable {
    let quote, length, author: String
    let tags: [String]
    let category, language, date: String
    let permalink: String
    let id: String
    let background: String
    let title: String
}

// MARK: - Copyright
struct QodCopyright: Decodable {
    let year: Int
    let url: String
}

// MARK: - Success
struct QodSuccess: Decodable {
    let total: Int
}
