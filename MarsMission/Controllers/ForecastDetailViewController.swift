//
//  ForecastDetailViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/10.
//

import UIKit

class ForecastDetailViewController: UIViewController {
	private lazy var forecastDetailViewModel =  ForecastDetailViewModel(forecastDetailView: self)
	
	var safe = Bool()
	var windSpeed = Int()
	var temp = Double()
	var date = String()
	var humidity = Int()
	
	@IBOutlet weak var forecastDetailSafe: UILabel!
	@IBOutlet weak var forecastDetailHumidity: UILabel!
	@IBOutlet weak var forecastDetailWindSpeed: UILabel!
	@IBOutlet weak var forecastDetailDateLabel: UILabel!
	@IBOutlet weak var forecastDetailTempLabel: UILabel!
	@IBOutlet weak var forecastDetailViewController: UIView!

	override func viewDidLoad() {
		super.viewDidLoad()
		self.forecastDetailViewModel.forecastDetailUIConfiguration()
	}
}

extension ForecastDetailViewController: ForecastDetailView {
	func setupForecastDetailViewData(_ safe: Bool, _ temp: Double) {
	}
	
	func forecastDetailViewUI() {
		forecastDetailViewController.layer.cornerRadius = 25
		navigationItem.title = date
	}
	
	func setupForecastDetailView() {
		self.forecastDetailDateLabel.text = date
		self.forecastDetailTempLabel.text = "Temp: \(temp) °C"
		self.forecastDetailHumidity.text = "Humidity: \(humidity) %"
		self.forecastDetailSafe.text = "Weather Condition: \(safe == true ? "Safe" : "Not Safe")"
		self.forecastDetailWindSpeed.text = "WindSpeed: \(windSpeed) Km/h"
	}
}
