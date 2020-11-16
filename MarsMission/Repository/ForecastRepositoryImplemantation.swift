//
//  ForecastRepositoryImplemantation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

class ForecastRepositoryImplemantation: ForecastRepository {
	let forecastservice: ForecastServiceImplementation
	
	init(forecastservice: ForecastServiceImplementation) {
		self.forecastservice = forecastservice
	}
	
	func fetchForecast(completion: @escaping (Result<Forecast, Error>) -> Void) {
		forecastservice.fetchForecast { (result) in
			switch result {
				case .success(let weather):
					completion(Result.success(weather))
				case .failure(let error):
					completion(Result.failure(error))
			}
		}
	}
}
