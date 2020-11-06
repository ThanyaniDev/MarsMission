//
//  Service.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation

protocol Service {
	func fetchWeatherData(completion:  @escaping (Result<WeatherData, NetworkError>) -> Void )
}
