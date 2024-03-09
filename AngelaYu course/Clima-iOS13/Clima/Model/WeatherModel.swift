//
//  WeatherModel.swift
//  Clima
//
//  Created by yunus on 27.02.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    var weatherId: Int
    var cityName: String
    var temperature: Float
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    var conditionName: String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
    
    
