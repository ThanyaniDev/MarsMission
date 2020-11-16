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
	let convertedDate =  format.date(from: date)
	format.timeZone =  TimeZone(abbreviation: "GMT+0:00")
	format.dateFormat = "E, d MMM yyyy"
	let dateString =  format.string(from: convertedDate ?? Date())
	return dateString
}
