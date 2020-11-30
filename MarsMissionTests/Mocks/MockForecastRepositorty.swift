//
//  MockForecastRepositorty.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/25.
//

import Foundation
import XCTest
@testable import MarsMission

class MockForecastRepository: ForecastRepository {
	
	var error: Error?
	var expectation: XCTestExpectation?
	
	func fetchForecast(completion: @escaping (Result<Forecast, Error>) -> Void) {
		guard let filePath = Bundle(for: type(of: self)).path(forResource: "Forecast", ofType: "json") else {
			fatalError("json not found")
		}
		
		guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else {
			fatalError("Unable to convert json to String")
		}
		
		let forecast = json.data(using: .utf8)!
		let forecastData = try! JSONDecoder().decode(Forecast.self, from: forecast)
		
		if let error = error {
			completion(.failure(error))
		} else {
			completion(.success(forecastData))
		}
		expectation?.fulfill()
	}
}
