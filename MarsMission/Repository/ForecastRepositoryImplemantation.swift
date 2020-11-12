//
//  ForecastRepositoryImplemantation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

class ForecastRepositoryImplemantation: ForecastRepository {
	func fetchForecast(completion: @escaping (Result<Forecast, Error>) -> Void) {
		ForecastServiceImplementation.shared.fetchForecast { (result) in
			switch result {
				case .success(let weather):
					completion(Result.success(weather))
				case .failure(let error):
					completion(Result.failure(error))
			}
		}
	}
}
