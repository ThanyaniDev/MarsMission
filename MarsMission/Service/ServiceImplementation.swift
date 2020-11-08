//
//  ServiceImplementation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation

class ServiceImplementation: Service {
	static let shared = ServiceImplementation()
	
	func fetchWeatherData(completion: @escaping (Result<WeatherData, NetworkError>) -> Void) {
		guard let url = URL(string: keys.endpoint.Url) else {
			completion(.failure(.clientError))
			return
		}
		let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
			do{
				if let _ = error {
					completion(.failure(.dataError))
				}
				if let data = data {
					let weatherForecast =  try JSONDecoder().decode(WeatherData.self, from: data)
					completion(.success(weatherForecast))
					print(weatherForecast)
				} else {
					completion(.failure(.jsonfailedError))
				}
			}
			catch {
				completion(.failure(.responseError))
			}
		})
		task.resume()
	}
}
