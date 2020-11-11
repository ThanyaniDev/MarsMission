//
//  ForecastView.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/10.
//

import Foundation

protocol ForecastView {
	func reloadForecastCollectionView()
	func showForecastView()
	func hideForecastView()
	func showLoadingIndicator()
	func hideLoadingIndicator()
}
