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
	
	func gettingWeatherData() {
		DispatchQueue.global(qos: .background).async {
			self.repository.getWeatherData { (result) in
				switch result {
					case .success(let weatherdata):
						self.weatherfecthWeatherDataSuccess(weatherdata)
					case .failure(let error):
						self.weatherfecthWeatherDataFail(error)
				}
			}
		}
	}
	
	private func weatherfecthWeatherDataSuccess(_ weatherdata: WeatherData) {
		DispatchQueue.main.async {
			self.weatherdata = weatherdata
			self.view.populateWeatherData("\(weatherdata.mn) NaN° F | C")
		}
	}
	
	private func weatherfecthWeatherDataFail(_ error: Error) {
		DispatchQueue.main.async {
			print(error)
		}
	}
}
