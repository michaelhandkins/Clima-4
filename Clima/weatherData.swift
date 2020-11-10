//
//  weatherData.swift
//  Clima
//
//  Created by Michael Handkins on 11/10/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    let main: Main
    let weather: [Weather]
    let name: String
    
}

struct Weather: Codable {
    let id: Int
}

struct Main: Codable {
    let temp: Double
}
