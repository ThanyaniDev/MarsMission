//
//  ForecastViewModel.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation
import UIKit

class ForecastViewModel {
	
	let forecastTitle:String = .forecastTitle
	let forecastRepository: ForecastRepository
	
	var forecast: Forecast?
	var view: ForecastView
	
	init(view: ForecastView,forecastRepository: ForecastRepository) {
		self.view = view
		self.forecastRepository = forecastRepository
	}
	
	func forecastUIConfigration() {
		self.view.forecastTitle(forecastTitle)
		self.view.hideLoadingIndicator()
	}
	
	func fetchForecast() {
		self.view.showLoadingIndicator()
		DispatchQueue.global(qos: .background).async {
			self.forecastRepository.fetchForecast { (result) in
				switch result {
					case .success(let forecast):
						self.handleThatFecthForecastDataSucceeds(forecast)
					case .failure(let error):
						self.handleThatFecthForecastDataFail(error)
				}
			}
		}
	}

	private func handleThatFecthForecastDataSucceeds(_ forecast: Forecast) {
		DispatchQueue.main.async { [weak self] in
			self?.forecast = forecast
			self?.view.reloadForecastCollectionView()
			self?.view.hideLoadingIndicator()
			self?.view.forecastFooter(self?.forecast?.weatherStation ?? "", self?.forecast?.lastUpdated ?? "")
		}
	}
	
	private func handleThatFecthForecastDataFail(_ error: Error) {
		DispatchQueue.main.async {
			self.view.hideLoadingIndicator()
			self.view.forecastDataFailureAlert()
		}
	}
}
