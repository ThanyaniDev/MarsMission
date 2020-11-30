//
//  MockForecastService.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/16.
//

import Foundation
@testable import MarsMission

class MockForecastService: ForecastService {
	
	var shouldReturnError =  false
	
	enum MockServiceError: Error {
		case serviceError
	}
	
	func reset() {
		shouldReturnError = false
	}
	
	convenience init() {
		self.init(false)
	}
	
	init(_ shouldReturnError: Bool) {
		self.shouldReturnError = shouldReturnError
	}
	
	func fetchForecast(completion: @escaping (Result<Forecast, Error>) -> Void) {
		guard let filePath = Bundle(for: type(of: self)).path(forResource: "Forecast", ofType: "json") else {
			fatalError("json not found")
		}
		
		guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {
			fatalError("Unable to convert json to String")
		}
		
		let forecast = json.data(using: .utf8)!
		let forecastData = try! JSONDecoder().decode(Forecast.self, from: forecast)
		
		shouldReturnError == true ? completion(.failure(MockServiceError.serviceError)) : completion(Result.success(forecastData))
	}
}


