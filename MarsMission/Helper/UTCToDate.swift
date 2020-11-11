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
	format.timeZone =  TimeZone.current
	format.dateFormat = "MMM d, h:mm a"
	let localDateString =  format.string(from: convertedDate ?? Date())
	return localDateString
}
