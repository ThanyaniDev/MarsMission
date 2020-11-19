//
//  UTCToDate.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/07.
//

import Foundation

func ConvertUTCDateToLocalDate(date:String) -> String {
	let format = DateFormatter()
	format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
	format.timeZone =  TimeZone(abbreviation: "GMT+0:00")
	format.dateFormat = "E, d MMM yyyy"
	return format.string(from: format.date(from: date) ?? Date())
}
