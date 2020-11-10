//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    
    var weatherManager = WeatherManager()
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let searchText = searchField.text {
            weatherManager.fetchWeather(cityName: searchText)
        }
    }
    
    @IBAction func navButtonPressed(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
    }

}

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, model: WeatherModel) {
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage(systemName: model.conditionSymbol)
            self.temperatureLabel.text = model.temp
            self.cityLabel.text = model.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print("Failed to retrieve data from weather API: \(error)")
    }
    
}

