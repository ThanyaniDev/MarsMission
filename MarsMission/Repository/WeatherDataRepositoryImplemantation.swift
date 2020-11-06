//
//  WeatherDataRepositoryImplemantation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

class WeatherDataRepositoryImplemantation: WeatherDataRepository {
	
	private let service = ServiceImplementation()
	
	func getWeatherData(completion: @escaping (Result<WeatherData, NetworkErrors>) -> Void) {
		service.getWeatherData { (result) in
			switch result {
				case .success(let weather):
					completion(.success(weather))
				case .failure( _):
					completion(.failure(.responseError))
			}
		}
	}
}
