//
//  ForecastServiceImplementation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation
import Alamofire

class ForecastServiceImplementation: ForecastService {
	private let serviceError = NSError(domain: "", code: 1, userInfo: nil)
	
	func fetchForecast(completion: @escaping (Result<Forecast, Error>) -> Void) {
		guard let url = URL(string:.forecastUrl) else { completion(.failure(serviceError))
			return
		}
		AF.request(url).validate().responseJSON { response in
			if let error = response.error { completion(.failure(error))
			}
			do {
				if let data = response.data {
					let forecast =  try JSONDecoder().decode(Forecast.self, from: data)
					completion(.success(forecast))
				} else {
					completion(.failure(self.serviceError))
				}
			}
			catch {
				completion(.failure(error))
			}
		}
	}
}
