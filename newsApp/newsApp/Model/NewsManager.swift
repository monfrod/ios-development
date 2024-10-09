//
//  NewsManager.swift
//  newsApp
//
//  Created by yunus on 28.02.2024.
//

import Foundation
import UIKit

struct NewsManager {
    
    typealias CompletionHandler = (NewsData) -> Void
    let newsAPI = "https://newsapi.org/v2/everything?from=2024-09-06&sortBy=publishedAt&apiKey=415b002b2faa49689878e12f5f4c2b01&q="
    func fetchNews(queryNews: String, completion: @escaping CompletionHandler){
        let urlString = "\(newsAPI)\(queryNews)"
        performRequest(urlString: urlString, completion: completion)
    }
    func performRequest(urlString: String, completion: @escaping CompletionHandler){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    do {
                    let decoderData = try JSONDecoder().decode(NewsData.self, from: safeData)
                    completion(decoderData)
                        } catch {
                            print(error)
                        }
                }
            }
            task.resume()
        }
    }
}
