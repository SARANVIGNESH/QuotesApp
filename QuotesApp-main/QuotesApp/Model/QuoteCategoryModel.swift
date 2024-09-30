//
//  QuoteCategoryModel.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import Foundation

// MARK: - QuoteCategory
struct QuoteCategory: Decodable {
    let success: QuoteSuccess
    let contents: QuoteContents
    let baseurl: String
    let copyright: QuoteCopyright
}

// MARK: - Contents
struct QuoteContents: Decodable {
    let categories: Categories
}

// MARK: - Categories
struct Categories: Decodable {
    let art, funny, inspire, life: String
    let love, management, sports, students: String
}

// MARK: - Copyright
struct QuoteCopyright: Decodable {
    let year: Int
    let url: String
}

// MARK: - Success
struct QuoteSuccess: Decodable {
    let total: Int
}
