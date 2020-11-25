//
//  ForecastViewModel.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation
import UIKit

class ForecastViewModel {
	private lazy var forecastRepository: ForecastRepository? = ForecastRepositoryImplementation(forecastService: ForecastServiceImplementation())
	
	let forecastTitle: String = .forecastTitle
	
	var forecast: Forecast?
	var forecastView: ForecastView
	
	init(view: ForecastView) {
		self.forecastView = view
	}
	
	func forecastUIConfiguration() {
		self.forecastView.hideLoadingIndicator()
		self.forecastView.forecastTitle(forecastTitle)
	}
	
	func fetchForecast() {
		self.forecastView.showLoadingIndicator()
		DispatchQueue.global(qos: .background).async {
			self.forecastRepository?.fetchForecast { (result) in
				switch result {
					case .success(let forecast):
						self.handleThatFetchForecastDataSucceeds(forecast)
					case .failure(let error):
						self.handleThatFetchForecastDataFail(error)
				}
			}
		}
	}
	
	private func handleThatFetchForecastDataSucceeds(_ forecast: Forecast) {
		DispatchQueue.main.async { [weak self] in
			self?.forecast = forecast
			self?.forecastView.hideLoadingIndicator()
			self?.forecastView.reloadForecastCollectionView()
			self?.forecastView.forecastFooter(self?.forecast?.weatherStation ?? "", self?.forecast?.lastUpdated ?? "")
		}
	}
	
	private func handleThatFetchForecastDataFail(_ error: Error) {
		DispatchQueue.main.async {
			self.forecastView.hideLoadingIndicator()
			self.forecastView.forecastDataFailureAlert()
		}
	}
}
