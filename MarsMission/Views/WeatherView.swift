//
//  WeatherView.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation

protocol WeatherView {
	func populateWeatherData(_ lastUpdated: String,_ weatherStation: String)
	func configureUI()
	func setUpCollectionView()
}
