//
//  ForecastRepositoryImplemantation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

class ForecastRepositoryImplemantation: ForecastRepository {
	let forecastService: ForecastService
	
	init(forecastService: ForecastService) {
		self.forecastService = forecastService
	}
	
	func fetchForecast(completion: @escaping (Result<Forecast, Error>) -> Void) {
		forecastService.fetchForecast { result in
			switch result {
				case .success(let forecast):
					completion(Result.success(forecast))
				case .failure(let error):
					completion(Result.failure(error))
			}
		}
	}
}
