//
//  LandingViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/03.
//

import UIKit

class LandingViewController: UIViewController {
	
	@IBOutlet weak var dailyWeatherReport: UIButton!
	@IBOutlet weak var threeDayWeatherReport: UIButton!
	@IBOutlet weak var seasonalWeatherReport: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = keys.navigationTitle.landingtitle
		dailyWeatherReport.layer.cornerRadius = 30
		threeDayWeatherReport.layer.cornerRadius = 30
		seasonalWeatherReport.layer.cornerRadius = 30
	}
	
	@IBAction func didTapDailyWeatherReport(_ sender: Any) {
		navigationController?.pushViewController(DetailsViewController(nibName: keys.nibName.weatherDetails, bundle: nil), animated: true)
	}
	
	@IBAction func didTap3DayWeatherReport(_ sender: Any) {
		//navigationController?.pushViewController((nibName:, bundle: nil), animated: true)
	}
	
	@IBAction func didTapSeasonalWeatherReport(_ sender: Any) {
		//navigationController?.pushViewController((nibName: , bundle: nil), animated: true)
	}
}



