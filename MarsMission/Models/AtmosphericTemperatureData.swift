//
//  AtmosphericTemperatureData.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation


struct AtmosphericTemperatureData: Codable {
   
    var sol: Int
    var av: Double
    var ct: Int
    var mn: Double
    var mx: Double
    
}
