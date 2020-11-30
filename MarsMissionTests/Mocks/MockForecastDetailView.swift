//
//  MockForecastDetailView.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/26.
//

import Foundation
@testable import MarsMission

class MockForecastDetailView: ForecastDetailView {
	var didPresentForecastDetailView = false
	var didSetupForecastDetailView = false
	
	func forecastDetailViewUI() {
		didPresentForecastDetailView = true
	}
	
	func setupForecastDetailView() {
		didSetupForecastDetailView = true
	}
}
