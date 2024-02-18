//
//  ViewController.swift
//  Weather
//
//  Created by yunus on 02.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var WeatherLabel: UILabel!
    @IBOutlet var GetWeatherButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GetWeatherButton.addTarget(self, action: #selector(DidTapGetWeather), for: .touchUpInside)
    }
    @objc func DidTapGetWeather(){
        let URLString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true"
        let URL = URL(string: URLString)!
        let request = URLRequest(url: URL)
        let task = URLSession.shared.dataTask(with: request){data, responce, error in
            if let data, let weather = try? JSONDecoder().decode(WeatherData.self, from: data){
                DispatchQueue.main.async {
                    self.WeatherLabel.text = "\(weather.currentWeather.temperature)"
                }
            }else{
                print("Fail!")
            }
        }
        task.resume()
    }


}

