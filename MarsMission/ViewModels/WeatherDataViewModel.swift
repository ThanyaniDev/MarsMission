//
//  WeatherDataViewModel.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation
import UIKit

class WeatherDataViewModel {
	let repository = WeatherDataRepositoryImplemantation()
	
	var weatherData: WeatherData?
	var view: WeatherView
	
	init(view: WeatherView) {
		self.view = view
	}
	
	func fetchWeatherData() {
		DispatchQueue.global(qos: .background).async {
			self.repository.fetchWeatherData { (result) in
				switch result {
					case .success(let weatherData):
						self.handleThatWeatherDataSucceeds(weatherData)
						print(weatherData)
					case .failure(let error):
						self.handleThatWeatherDataFail(error)
				}
			}
		}
	}
	
	private func handleThatWeatherDataSucceeds(_ weatherData: WeatherData) {
		DispatchQueue.main.async { [self] in
			self.weatherData = weatherData
			self.view.populateWeatherData(weatherData.lastUpdated!,
										  weatherData.weatherStation!,
										  weatherData.forecasts[0].date!,
										  weatherData.forecasts[1].temp!)
			
		}
	}
	
	private func handleThatWeatherDataFail(_ error: Error) {
		DispatchQueue.main.async {
			let alert = UIAlertController(title: "An error occured", message: error.localizedDescription, preferredStyle: .alert)
			let okButton = UIAlertAction(title: "OK", style: .default)
			alert.addAction(okButton)
		}
	}
}
