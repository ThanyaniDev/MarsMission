//
//  ForecastDetailViewModelTest.swift
//  MarsMissionTests
//
//  Created by Thanyani on 2020/11/26.
//

import XCTest
@testable import MarsMission

class ForecastDetailViewModelTest: XCTestCase {
	var systemUnderTest: ForecastDetailViewModel?
	var mockForecastDetailView = MockForecastDetailView()

    override func setUpWithError() throws {
		systemUnderTest = ForecastDetailViewModel(forecastDetailView: mockForecastDetailView)
    }

    override func tearDownWithError() throws {
       systemUnderTest = nil
    }
	
	func testForecastDetailUIConfiguration() throws {
		systemUnderTest?.forecastDetailUIConfiguration()
		XCTAssertTrue(mockForecastDetailView.didSetupForecastDetailView)
		XCTAssertTrue(mockForecastDetailView.didPresentForecastDetailView)
	}
}
