//
//  AtmosphericTemperatureData.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

struct WeatherData: Codable {
	var forecasts: [forecastsData]
	var lastUpdated: String?
	var weatherStation: String?
}

struct forecastsData: Codable {
	var date: String?
	var temp: Double?
	var humidity: Int?
	var windSpeed: Int?
	var safe: Bool?
}




