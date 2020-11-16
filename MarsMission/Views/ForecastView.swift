//
//  ForecastView.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/10.
//

import Foundation

protocol ForecastView {
	func reloadForecastCollectionView()
	func forecastTitle(_ title: String)
	func showLoadingIndicator()
	func hideLoadingIndicator()
	func forecastFooter(_ weatherStation: String, _ lastUpdated: String)
}
