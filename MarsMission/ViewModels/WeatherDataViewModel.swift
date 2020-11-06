//
//  WeatherDataViewModel.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation


class WeatherDataViewModel {
	
	let repository = WeatherDataRepositoryImplemantation()
	
	var weatherdata: WeatherData?
	var view: WeatherView
	
	init(view: WeatherView) {
		self.view = view
	}
	
	func fetchWeatherData() {
		DispatchQueue.global(qos: .background).async {
			self.repository.fetchWeatherData { (result) in
				switch result {
					case .success(let weatherdata):
						self.handleThatWeatherDataSuccess(weatherdata)
					case .failure(let error):
						self.handleThatWeatherDataFail(error)
				}
			}
		}
	}
	
	private func handleThatWeatherDataSuccess(_ weatherdata: WeatherData) {
		DispatchQueue.main.async {
			self.weatherdata = weatherdata
			self.view.populateWeatherData(weatherdata.lastUpdated)
		}
	}
	
	private func handleThatWeatherDataFail(_ error: Error) {
		DispatchQueue.main.async {
			print(error)
		}
	}
}
