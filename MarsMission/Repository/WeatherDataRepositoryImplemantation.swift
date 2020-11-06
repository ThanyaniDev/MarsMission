//
//  WeatherDataRepositoryImplemantation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

class WeatherDataRepositoryImplemantation: WeatherDataRepository {
	
	func fetchWeatherData(completion: @escaping (Result<WeatherData, NetworkError>) -> Void) {
		ServiceImplementation.shared.fetchWeatherData { (result) in
			switch result {
				case .success(let weather):
					completion(.success(weather))
				case .failure( _):
					completion(.failure(.responseError))
			}
		}
	}
}
