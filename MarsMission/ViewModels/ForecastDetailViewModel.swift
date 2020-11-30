//
//  ForecastDetailViewModel.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/23.
//

import Foundation

class ForecastDetailViewModel {
	var forecast: Forecast?
	var forecastDetailView: ForecastDetailView
	
	init(forecastDetailView: ForecastDetailView ) {
		self.forecastDetailView = forecastDetailView
	}
	
	func forecastDetailUIConfiguration() {
		self.forecastDetailView.forecastDetailViewUI()
		self.forecastDetailView.setupForecastDetailView()
	}
}
