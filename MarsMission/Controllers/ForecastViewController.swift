//
//  ForecastViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/11.
//

import UIKit

class ForecastViewController: UIViewController {
	private lazy  var forecastViewModel =  ForecastViewModel(view: self)
	
	@IBOutlet weak var forecastTitle: UILabel!
	@IBOutlet weak var forecastLastUpdated: UILabel!
	@IBOutlet weak var forecastWeatherStation: UILabel!
	@IBOutlet weak var forecastCollectionView: UICollectionView!
	@IBOutlet weak var forecastActivityIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		forecastViewModel.fetchForecast()
		forecastCollectionView.delegate = self
		forecastCollectionView.dataSource = self
		navigationItem.title = .forecastNavTitle
		forecastViewModel.forecastUIConfiguration()
		forecastCollectionView.register(ForecastViewCell.self, forCellWithReuseIdentifier: .reuseIdentifier)
	}
}

extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return forecastViewModel.forecast?.forecasts.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .reuseIdentifier, for: indexPath) as! ForecastViewCell
		guard let forecast =  forecastViewModel.forecast?.forecasts[indexPath.row] else {
			return cell
		}
		cell.forecastDateLabel.text = convertUTCDateToLocalDate(date: forecast.date ?? "")
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let forecastDetail = forecastViewModel.forecast?.forecasts[indexPath.row]
		let forecastDetailsViewController = ForecastDetailViewController(nibName: .forecastDetailViewControllerNibName, bundle: nil)
		forecastDetailsViewController.temp = forecastDetail?.temp ?? 0
		forecastDetailsViewController.safe = forecastDetail?.safe ?? false
		forecastDetailsViewController.humidity = forecastDetail?.humidity ?? 0
		forecastDetailsViewController.windSpeed = forecastDetail?.windSpeed ?? 0
		forecastDetailsViewController.date = convertUTCDateToLocalDate(date: forecastDetail?.date ?? "")
		self.navigationController?.pushViewController(forecastDetailsViewController, animated: true)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width - 225, height: 120)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return  UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
	}
}

extension ForecastViewController: ForecastView {
	func reloadForecastCollectionView() {
		self.forecastCollectionView.reloadData()
	}
	
	func showLoadingIndicator() {
		self.forecastActivityIndicator.startAnimating()
		self.forecastActivityIndicator.isHidden = false
	}
	
	func hideLoadingIndicator() {
		self.forecastActivityIndicator.stopAnimating()
		self.forecastActivityIndicator.isHidden = true
	}
	
	func forecastTitle(_ title: String) {
		self.forecastTitle.text = forecastViewModel.forecastTitle
	}
	
	func forecastFooter(_ weatherStation: String, _ lastUpdated: String) {
		self.forecastLastUpdated.text = convertUTCDateToLocalDate(date: forecastViewModel.forecast?.lastUpdated ?? "")
		self.forecastWeatherStation.text = forecastViewModel.forecast?.weatherStation
	}
	
	func forecastDataFailureAlert() {
		let alert = UIAlertController(title: "Unexpected error happened.", message: "An error occurred.retry later", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
			self.forecastViewModel.fetchForecast()
		}))
		self.present(alert, animated: true)
	}
}

