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
		guard let url = URL(string: keys.endpoint.Url) else { return }
		let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let _ = error {
				completion(.failure(.dataError))
				return
			}
			guard let response = response as? HTTPURLResponse,  response.statusCode == 200 else {
				completion(.failure(.responseError))
				return
			}
			guard let data = data else {
				completion(.failure(.dataError))
				return
			}
			do {
				let decoder =  JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				let weatherData = try decoder.decode(WeatherData.self, from: data)
				completion(.success(weatherData))
				print(weatherData)
				
			} catch {
				completion(.failure(.jsonfailedError))
			}
		}
		dataTask.resume()
	}
}
