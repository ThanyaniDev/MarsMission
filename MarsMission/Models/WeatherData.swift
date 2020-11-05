//
//  AtmosphericTemperatureData.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation


struct WeatherData: Codable {
	
        var avarageValue: Double
        var recordedSamplesOverSol: Int
        var minValue: String
        var maxValue: String

        init(data: Dictionary<String, Any>) {
            self.avarageValue = data["av"] as! Double
            self.recordedSamplesOverSol = data["ct"] as! Int
            self.minValue = data["mn"] as! String
            self.maxValue = data["mx"] as! String
        }
    
}


