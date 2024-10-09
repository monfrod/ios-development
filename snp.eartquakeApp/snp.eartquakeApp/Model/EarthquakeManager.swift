//
//  EarthquakeManager.swift
//  snp.eartquakeApp
//
//  Created by yunus on 23.09.2024.
//
import Foundation
import UIKit

protocol EarthquakeManagerDelegate {
    func didUpdateEarthquake(earthquake: EarthquakeResponse?)
}

struct EarthquakeManager {
    
    typealias CompletionHandler = (EarthquakeResponse) -> Void
    var delegate: EarthquakeManagerDelegate?
    let api = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson"
    
    func fetchEvents(/*from urlString: String*/) {
        performRequest(urlString: api)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                if let data = data {
                    if let earthquakeResponse = parseJSON(data: data) {
                        delegate?.didUpdateEarthquake(earthquake: earthquakeResponse)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> EarthquakeResponse? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(EarthquakeResponse.self, from: data)
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
