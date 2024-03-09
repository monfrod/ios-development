//
//  NewsManager.swift
//  News
//
//  Created by yunus on 27.02.2024.
//

import Foundation
struct NewsManager {
    let newsAPI = "https://newsapi.org/v2/everything?q=apple&from=2024-01-27&sortBy=publishedAt&apiKey=415b002b2faa49689878e12f5f4c2b01"
    func fetchNews(/*queryNews: String*/){
//        let urlString = "\(newsAPI)\(queryNews)"
        performRequest(urlString: newsAPI)
    }
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    parseJSON(newsData: safeData)
                }
            }
            task.resume()
        }
        
    }
    func parseJSON(newsData: Data){
        let decoder = JSONDecoder()
        do{
            let decoderData = try decoder.decode(NewsData.self, from: newsData)
            //let a = decoderData.totalResult
            print(decoderData.articles[0].source.name)
        } catch {
            print(error)
        }
    }
}
