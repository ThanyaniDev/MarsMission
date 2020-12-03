//
//  AtmosphericTemperatureData.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

struct Forecast: Codable {
	var forecasts: [ForecastData]
	var lastUpdated: String?
	var weatherStation: String?
}

struct ForecastData: Codable {
	var date: String? 
	var temp: Double?
	var humidity: Int?
	var windSpeed: Int?
	var safe: Bool?
}

struct SolForecast: Codable {
	var atmosphericTemperature: MarsForecastData
	var firstUTC: String
	
	init(solDict: Dictionary<String, Any>) {
		self.atmosphericTemperature = MarsForecastData(solForecastDict: solDict["AT"] as! Dictionary<String, Any>)
		self.firstUTC = solDict["First_UTC"] as! String
	}
}

struct MarsForecastData: Codable {
	var averageValue: Double
	var recordedSamplesOverSol: Int
	var minValue: Double
	var maxValue: Double
	
	init(solForecastDict: Dictionary<String, Any>) {
		self.averageValue = solForecastDict["av"] as! Double
		self.recordedSamplesOverSol = solForecastDict["ct"] as! Int
		self.minValue = solForecastDict["mn"] as! Double
		self.maxValue = solForecastDict["mx"] as! Double
	}
}
