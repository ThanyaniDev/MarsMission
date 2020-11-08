//
//  NetworkErrors.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import Foundation

enum NetworkError: String, Error {
	case dataError = "data Error"
	case responseError = "response error"
	case jsonfailedError = "json failed"
	case clientError = "clientError"
}
