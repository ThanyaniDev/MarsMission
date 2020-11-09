//
//  LandingViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/03.
//

import UIKit

class LandingViewController: UIViewController {
	private lazy  var viewModel =  WeatherDataViewModel(view: self)
	
	@IBOutlet weak var lastUpdatedLabel: UILabel!
	@IBOutlet weak var weatherStationLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.fetchWeatherData()
		configureUI()
		navigationItem.title = keys.navigationTitle.landingTitle
	}
}

extension LandingViewController: WeatherView {
	func configureUI() {
		collectionView.layer.cornerRadius = 40
		
		self.collectionView.register(weatherForecastViewCell.self, forCellWithReuseIdentifier: keys.Identifier.weatherForecastCellId)
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
	}
	
	func populateWeatherData(_ lastUpdated: String, _ weatherStation: String,_ date: String,_ temp: Double) {
		self.lastUpdatedLabel.text = "Last Updated: \(convertUTCDateToLocalDate(date: lastUpdated))"
		self.weatherStationLabel.text = "Weather Station: \(weatherStation)"
	}
}

extension LandingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: keys.Identifier.weatherForecastCellId, for: indexPath) as! weatherForecastViewCell
		cell.layer.cornerRadius = 10
		cell.backgroundColor = .darkGray
		cell.dateLabel.text = "weather"
		cell.tempLabel.text = "200.0f"
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let insets:CGFloat = 10
		return UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 150, height: 150)
	}
}


