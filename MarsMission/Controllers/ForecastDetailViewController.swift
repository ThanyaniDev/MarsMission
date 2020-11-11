//
//  DetailViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/10.
//

import UIKit

class ForecastDetailViewController: UIViewController {
	
	@IBOutlet weak var forecastDetailViewController: UIView!
	@IBOutlet weak var forecastDetailSafe: UILabel!
	@IBOutlet weak var forecastDetailWindSpeed: UILabel!
	@IBOutlet weak var forecastDetailHumidity: UILabel!
	@IBOutlet weak var forecastDetailDateLabel: UILabel!
	@IBOutlet weak var forecastDetailTempLabel: UILabel!
	
	var safe = Bool()
	var windSpeed = Int()
	var temp = Double()
	var date = String()
	var humidity = Int()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		forecastDetailViewController.layer.cornerRadius = 25
		forecastDetailHumidity.text = "Humidity: \(humidity)"
		forecastDetailTempLabel.text = "Temp: \(temp)°C"
		forecastDetailSafe.text = "Safe: \(safe)"
		forecastDetailWindSpeed.text = "WindSpeed: \(windSpeed) Km/h"
		forecastDetailDateLabel.text = date
	}
}
