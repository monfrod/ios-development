//
//  WeatherManager.swift
//  Clima
//
//  Created by yunus on 31.01.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager{
    let delegate: WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1a26bffb657e175009fa32aeaffb0e50&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let weather = parseJSON(weatherData: safeData){
                        delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            let ID = decoderData.weather[0].id
            let temp = decoderData.main.temp
            let name = decoderData.name
            
            let weather = WeatherModel(weatherId: ID, cityName: name, temperature: temp)
            print(weather.conditionName)
            print(weather.temperatureString)
            
            return weather
        } catch {
            print(error)
            return nil
        }
    }
    
    
    
}
