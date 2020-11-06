//
//  WeatherDataRepository.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

protocol WeatherDataRepository {
	func getWeatherData(completion:  @escaping (Result<WeatherData, NetworkErrors>) -> Void )
}
