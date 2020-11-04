//
//  getData.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

public class GetData {
    
    @Published var atmosphericTemperatureData = [AtmosphericTemperatureData]()
    
    init() {
        fecthData()
    }
    
    func fecthData() {
        if let jsonLocation = Bundle.main.url(forResource: "testData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: jsonLocation)
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode([AtmosphericTemperatureData].self, from: data)
                self.atmosphericTemperatureData = jsonData
            } catch  {
                print(error)
            }
        }
    }
}
