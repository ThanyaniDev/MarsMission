//
//  ForecastService.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation

protocol ForecastService {
	func fetchForecast(completion:  @escaping (Result<Forecast, Error>) -> Void)
}
