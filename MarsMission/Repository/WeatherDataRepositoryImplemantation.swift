//
//  WeatherDataRepositoryImplemantation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

class WeatherDataRepositoryImplemantation: WeatherDataRepository {
   
    private let service = WeatherDataRepositoryImplemantation()
    
    func getData(completion: @escaping (Result<WeatherData, NetworkErrors>) -> Void) {
        service.getData { (result) in
            
            switch result {
            case .success(let weatherdata):
                completion(.success(weatherdata))
            case .failure(let error):
                completion(.failure(error))
                print(error)
            }
            
        }
    }
}
