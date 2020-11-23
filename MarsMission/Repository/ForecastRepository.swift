//
//  ForecastRepository.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

protocol ForecastRepository {
	func fetchForecast(completion:  @escaping (Result<Forecast, Error>) -> Void )
}
