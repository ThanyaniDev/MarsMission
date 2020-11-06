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
	}
	
	struct navigationTitle {
		static let landingtitle = "Mars Mission"
		static let detailsViewtitle = "Daily Weather Report"
	}
	
	
	struct endpoint {
		static let Url = "https://api.nasa.gov/insight_weather/?api_key=pn9u3Bxs3CjiCtIOlgcsZ0wt8bebWbEtHb5jhEwd&feedtype=json&ver=1.0"
	}
	
	
	struct Identifier {
		static let cellID = "searchCellID"
	}
}
