//
//  ForecastDetailView.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/23.
//

import Foundation

protocol ForecastDetailView {
	func forecastDetailViewUI()
	func setupForecastDetailView()
	func setupForecastDetailViewData(_ safe: Bool, _ temp: Double)
}
