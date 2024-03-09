//
//  NewsData.swift
//  News
//
//  Created by yunus on 27.02.2024.
//

import Foundation

struct NewsData: Decodable{
    let status: String
    let totalResult: Int
    let articles: [articles]
}
struct articles: Decodable {
    let source: source
}
struct source: Decodable{
    let id: String
    let name: String
}
