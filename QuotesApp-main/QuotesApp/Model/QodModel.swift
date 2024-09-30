//
//  QodModel.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import Foundation

// MARK: - Qod
struct Qod: Decodable {
    let success: Success
    let contents: Contents
    let baseurl: String
    let copyright: Copyright
}

// MARK: - Contents
struct Contents: Decodable {
    let quotes: [Quote]
}

// MARK: - Quote
struct Quote: Decodable {
    let quote, length, author: String
    let tags: [String]
    let category, language, date: String
    let permalink: String
    let id: String
    let background: String
    let title: String
}

// MARK: - Copyright
struct Copyright: Decodable {
    let year: Int
    let url: String
}

// MARK: - Success
struct Success: Decodable {
    let total: Int
}

