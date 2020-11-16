//
//  ForecastServiceImplementation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation

class ForecastServiceImplementation: ForecastService {
	static let shared = ForecastServiceImplementation()
	
	private let serviceError = NSError(domain: "", code: 1, userInfo: nil)
	
	func fetchForecast(completion: @escaping (Result<Forecast, Error>) -> Void) {
		guard let url = URL(string:.forecastUrl) else {
			completion(Result.failure(serviceError))
			return
		}
		let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
			do{
				if let error = error {
					completion(Result.failure(error))
				}
				if let data = data {
					let forecast =  try JSONDecoder().decode(Forecast.self, from: data)
					completion(Result.success(forecast))
				} else {
					completion(Result.failure(self.serviceError))
				}
			}
			catch {
				completion(Result.failure(error))
			}
		})
		task.resume()
	}
}
