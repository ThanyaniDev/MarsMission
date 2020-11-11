//
//  WeatherDataViewModel.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation
import UIKit

class ForecastViewModel {
	let forecastRepository = ForecastServiceImplementation()
	
	var forecast: Forecast?
	var view: ForecastView

	init(view: ForecastView) {
		self.view = view
	}

	func fetchForecast() {
		DispatchQueue.global(qos: .background).async {
			self.forecastRepository.fetchForecast { (result) in
				switch result {
					case .success(let weatherData):
						print(weatherData)
						self.handleThatFecthForecastDataSucceeds(weatherData)
					case .failure(let error):
						self.handleThatFecthForecastDataFail(error)
				}
			}
		}
	}
	
	private func handleThatFecthForecastDataSucceeds(_ weatherData: Forecast) {
		DispatchQueue.main.async { [weak self] in
			self?.forecast = weatherData
			self?.view.reloadForecastCollectionView()
		}
	}

	private func handleThatFecthForecastDataFail(_ error: Error) {
		DispatchQueue.main.async {

		}
	}
}
