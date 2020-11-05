//
//  ApiLayerImplemation.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

class ApiLayerImplemation: ApiLayer {
    
        
    func getData(completion: @escaping (Result<WeatherData, NetworkErrors>) -> Void) {
        
		guard let url = URL(string: keys.endpoint.Url) else {
            completion(.failure(.clientError))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { ( data, response, error) -> Void in
            do{
                if let _ = error {
                    completion(.failure(.dataError))
                }
                
                if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                    completion(.failure(.clientError))
                    return
                }
                
                if let data = data {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    completion(.success(weatherData))
                } else {
                    completion(.failure(.jsonfailedError))
                }
            }catch( _) {
                completion(.failure(.jsonfailedError))
            }
        })
        dataTask.resume()
    }
    
    
}
