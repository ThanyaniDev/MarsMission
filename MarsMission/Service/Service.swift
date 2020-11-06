//
//  Service.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import Foundation

protocol Service {
	func getWeatherData(completion:  @escaping (Result<WeatherData, NetworkErrors>) -> Void )
}
