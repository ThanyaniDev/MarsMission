//
//  ForecastRepositoryImplementationTest.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/16.
//

import XCTest
@testable import MarsMission

class ForecastRepositoryImplementationTest: XCTestCase {
	var mockForecastService = MockForecastService()
	var systemUnderTest: ForecastRepositoryImplementation?
	
    override func setUpWithError() throws {
		systemUnderTest = ForecastRepositoryImplementation(forecastService: mockForecastService)
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }

    func testForecastServiceSuccess() throws {
		var forecastResults:Forecast?
		
		systemUnderTest?.fetchForecast(completion: { result in
			forecastResults = try? result.get()
		})
		XCTAssertNotNil(forecastResults)
    }
	
	func testForecastServiceFailure() throws {
		mockForecastService.shouldReturnError = true

		var forecastResults:Forecast?

		systemUnderTest?.fetchForecast(completion: { result in
			forecastResults = try? result.get()
		})
		XCTAssertNil(forecastResults)
	}
}
