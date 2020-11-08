//
//  UTCToDate.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/07.
//

import Foundation

extension String {
	func fromUTCToDateMonthString() -> String {
		var convertedUTC = ""
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		let currentDate = formatter.date(from: self)
		formatter.locale = Locale(identifier: "bg_BG")
		formatter.dateFormat = "d MMM"
		convertedUTC = formatter.string(from: currentDate!)
		return convertedUTC
	}
}
