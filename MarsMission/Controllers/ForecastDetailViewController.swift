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
	override func viewDidLoad() {
        super.viewDidLoad()
		forecastDetailViewController.layer.cornerRadius = 25
    }
}
