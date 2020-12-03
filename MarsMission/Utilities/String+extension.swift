//
//  String+extension.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/03.
//

import Foundation
import UIKit

extension String {
	static let forecastUrl = "https://run.mocky.io/v3/04dc1be1-8609-48c9-b4a0-27a363aa22a9"
	static let forecastMarsMissionUrl = "https://api.nasa.gov/insight_weather/?api_key=pn9u3Bxs3CjiCtIOlgcsZ0wt8bebWbEtHb5jhEwd&feedtype=json&ver=1.0"
	static let forecastViewControllerNibName = "ForecastViewController"
	static let forecastDetailViewControllerNibName = "ForecastDetailViewController"
	static let forecastNavTitle = "Mars Mission"
	static let reuseIdentifier = "Cell"
	static let forecastTitle = "Mars Weather Forecast"
}
