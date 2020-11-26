//
//  ForecastViewModelTest.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/25.
//

import XCTest
@testable import MarsMission

class ForecastViewModelTest: XCTestCase {
	private let serviceError = NSError(domain: "", code: 1, userInfo: nil)
	
	var systemUnderTest: ForecastViewModel?
	var mockForecastView = MockForecastView()
	var mockForecastRepository = MockForecastRepository()
	
    override func setUpWithError() throws {
		systemUnderTest =  ForecastViewModel(view: mockForecastView, forecastRepository: mockForecastRepository)
    }

    override func tearDownWithError() throws {
       systemUnderTest = nil
    }
	
	func testForecastUIConfiguration() throws {
		systemUnderTest?.forecastUIConfiguration()
		XCTAssertTrue(mockForecastView.didHideLoadingIndicator)
	}
	
	func testFetchForecastReturnsSuccessData() throws {
		systemUnderTest?.fetchForecast()
		mockForecastRepository.expectation = self.expectation(description: "Forecast data was successfully called")
		mockForecastRepository.error = nil
		
		waitForExpectations(timeout: 10, handler: nil)
		XCTAssertNotNil(systemUnderTest?.forecast?.forecasts)
		XCTAssertTrue(mockForecastView.didShowLastUpdated)
		XCTAssertTrue(mockForecastView.didShowForecastTitle)
		XCTAssertTrue(mockForecastView.didShowWeatherStation)
		XCTAssertTrue(mockForecastView.didShowLoadingIndicator)
		XCTAssertTrue(mockForecastView.didHideLoadingIndicator)
		XCTAssertTrue(mockForecastView.didReloadForecastCollectionView)
	}
	
	func testFetchForecastReturnsError() throws {
		systemUnderTest?.fetchForecast()
		mockForecastRepository.expectation = self.expectation(description: "An error occurred while fetching data")
		mockForecastRepository.error = serviceError
		
		waitForExpectations(timeout: 10, handler: nil)
		XCTAssertNil(systemUnderTest?.forecast?.forecasts)
		XCTAssertTrue(mockForecastView.didHideLoadingIndicator)
		XCTAssertTrue(mockForecastView.didPresentDataFailureAlert)
	}
}
