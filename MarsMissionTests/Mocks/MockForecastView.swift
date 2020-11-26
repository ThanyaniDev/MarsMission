//
//  MockForecastView.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/25.
//

import Foundation
@testable import MarsMission

class MockForecastView: ForecastView {
	var didShowForecastTitle: Bool = false
	var didShowWeatherStation: Bool = false
	var didShowLastUpdated: Bool = false
	var didShowLoadingIndicator: Bool = false
	var didHideLoadingIndicator: Bool = false
	var didPresentDataFailureAlert: Bool = false
	var didReloadForecastCollectionView: Bool = false
	
	func reloadForecastCollectionView() {
		didReloadForecastCollectionView = true
	}
	
	func forecastTitle(_ title: String) {
		didShowForecastTitle = true
	}
	
	func showLoadingIndicator() {
		didShowLoadingIndicator = true
	}
	
	func hideLoadingIndicator() {
		didHideLoadingIndicator =  true
	}
	
	func forecastFooter(_ weatherStation: String, _ lastUpdated: String) {
		didShowWeatherStation = true
		didShowLastUpdated = true
	}
	
	func forecastDataFailureAlert() {
		didPresentDataFailureAlert = true
	}
}
