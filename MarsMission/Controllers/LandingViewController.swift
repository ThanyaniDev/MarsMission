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
		setUpCollectionView()
		navigationItem.title = keys.navigationTitle.landingTitle
	}
}

extension LandingViewController: WeatherView {
	func setUpCollectionView() {
		let nib = UINib(nibName: "weatherForecastViewCell", bundle: nil)
		self.collectionView.register(nib, forCellWithReuseIdentifier: "cell")
	}
	
	func configureUI() {
		collectionView.layer.cornerRadius = 60
	}
	
	func populateWeatherData(_ lastUpdated: String, _ weatherStation: String) {
		self.lastUpdatedLabel.text = "Last Updated: \(convertUTCDateToLocalDate(date: lastUpdated))"
		self.weatherStationLabel.text = "Weather Station: \(weatherStation)"
	}
}

extension LandingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.forecastsData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! weatherForecastViewCell
		cell.layer.cornerRadius = 10
		cell.backgroundColor = .blue
		cell.temp.text = viewModel.forecastsData[indexPath.row].date
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let insets:CGFloat = 10
		return UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 80, height: 80)
	}
}


