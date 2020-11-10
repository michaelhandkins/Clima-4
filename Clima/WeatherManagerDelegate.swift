//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Michael Handkins on 11/10/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, model: WeatherModel)
    
    func didFailWithError(error: Error)
}
