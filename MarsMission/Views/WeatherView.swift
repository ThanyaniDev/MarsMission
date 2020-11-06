//
//  WeatherView.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation

protocol WeatherView {
	//func populateWeatherData(_ lastUpdated: String,_ weatherStation: String, _ date: String,_ temp: Double,_ humidity: Int,_ windSpeed: Int,_ safe: Bool)
	func populateWeatherData(_ lastUpdated: String)
}
