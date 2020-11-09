//
//  Constants.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/03.
//

import Foundation


struct keys {    
	struct nibName {
		static let landingView = "LandingView"
		static let weatherDetails = "WeatherDetails"
		static let WeatherDetailViewController = "WeatherDetailViewController"
		static let weatherForecast = "weatherForecastViewCell"
	}
	
	struct navigationTitle {
		static let landingTitle = "Mars Mission"
		static let detailsViewTitle = "Daily Weather Report"
	}
	
	struct endpoint {
		static let Url = "https://run.mocky.io/v3/04dc1be1-8609-48c9-b4a0-27a363aa22a9"
	}
	
	struct Identifier {
		static let cellID = "searchCellID"
		static let weatherForecastCellId = "cell"
	}
}
