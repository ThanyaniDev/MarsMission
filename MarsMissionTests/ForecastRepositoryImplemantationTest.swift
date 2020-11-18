//
//  ForecastRepositoryImplemantationTest.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/16.
//

import XCTest
@testable import MarsMission

class ForecastRepositoryImplemantationTest: XCTestCase {
	
	var mockForecastService = MockForecastService()
	var systemUnderTest: ForecastRepositoryImplemantation?
	
    override func setUpWithError() throws {
		systemUnderTest = ForecastRepositoryImplemantation(forecastService: mockForecastService)
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }

    func testForecastServiceSuccess() throws {
		var forecastResults:Forecast?
		
		systemUnderTest?.fetchForecast(completion: { result in
			forecastResults = try? result.get()
		})
		
		XCTAssertEqual("2020-11-05T22:00:00.000+0000",forecastResults?.forecasts[0].date)
		XCTAssertEqual(40.0,forecastResults?.forecasts[1].temp)
		XCTAssertEqual(30,forecastResults?.forecasts[2].humidity)
		XCTAssertEqual(6000,forecastResults?.forecasts[3].windSpeed)
		XCTAssertEqual(false,forecastResults?.forecasts[4].safe)
		XCTAssertEqual("NASA Mars North Weather Station",forecastResults?.weatherStation)
		XCTAssertEqual("2020-11-07T22:00:00.000+0000",forecastResults?.lastUpdated)
    }
}
