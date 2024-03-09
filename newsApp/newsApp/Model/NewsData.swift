//
//  NewsData.swift
//  newsApp
//
//  Created by yunus on 28.02.2024.
//

import Foundation

struct NewsData: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Decodable {
    let id: String?
    let name: String?
}

