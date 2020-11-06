//
//  AtmosphericTemperatureData.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation


struct WeatherData: Codable {
	
	var solNum: String?
	var First_UTC: String?
	var av: Double = 0
	var mn: Double = 0
	var mv: Double = 0
	
	private enum weatherResponseKeys: String, CodingKey {
		case First_UTC
		case AT
	}
	
	private enum atmosphericTemp: String, CodingKey {
		case av
		case mn
		case mv
	}
	
	init(from decoder: Decoder) throws {
		
		if let continer = try? decoder.container(keyedBy: weatherResponseKeys.self) {
			
			//self.solNum =  continer.codingPath.first!.stringValue
			
			self.First_UTC = try continer.decode(String.self, forKey: weatherResponseKeys.First_UTC)
			if let atcon =  try? continer.nestedContainer(keyedBy: atmosphericTemp.self, forKey: .AT) {
				
				self.av = try atcon.decode(Double.self, forKey: .av)
				self.mn = try atcon.decode(Double.self, forKey: .mn)
				self.mv = try atcon.decode(Double.self, forKey: .mv)
			}
			
		}
	}
}




