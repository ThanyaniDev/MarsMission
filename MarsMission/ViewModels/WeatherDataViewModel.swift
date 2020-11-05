//
//  WeatherDataViewModel.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation


class WeatherDataViewModel {
    
    let repository = WeatherDataRepositoryImplemantation()
    
    var view : WeatherDetailView
    var weatherdata: WeatherData?
    
    init(view: WeatherDetailView) {
        self.view = view
    }
    
    
    func  fecthWeatherData() {
        DispatchQueue.global(qos: .background).async {
            
            self.repository.getData {
                (result) in
                switch result {
                case.success(let weatherdata):
                    self.weatherfecthWeatherDataSuccess(weatherdata)
                    print("Success")
                case .failure(let error):
                    self.weatherfecthWeatherDataFail(error)
                    print(error)
    
                }
            }
        }
    }
    
    private func weatherfecthWeatherDataSuccess(_ weatherdata: WeatherData) {
        DispatchQueue.main.async {
            self.weatherdata = weatherdata
        
          
        }
    }
    
    private func weatherfecthWeatherDataFail(_ error: Error) {
        DispatchQueue.main.async {
            print(error)
        }
    }
    
}
