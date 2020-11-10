//
//  WeatherManager.swift
//  Clima
//
//  Created by Michael Handkins on 11/10/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?units=imperial&appid=8c5a6f258e6582f6de7e2ba455fd2800&q=" + "\(cityName)"
        
        let url = URL(string: urlString)
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let safeError = error {
                print(safeError)
                self.delegate?.didFailWithError(error: safeError)
            }
            
            if let safeData = data {
                if let parsedJSON = parseJSON(data: safeData) {
                    let name = parsedJSON.name
                    let id = parsedJSON.weather[0].id
                    let temp = String(Int(parsedJSON.main.temp))
                    let weatherModel = WeatherModel(cityName: name, temp: temp, conditionID: id)
                    self.delegate?.didUpdateWeather(weatherManager: self, model: weatherModel)
                }
            }
        }
        
        task.resume()
        
    }
    
    func parseJSON(data: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(WeatherData.self, from: data)
        } catch {
            print("Error while decoding JSON data: \(error)")
        }
        return nil
    }
}
