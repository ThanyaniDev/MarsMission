//
//  ForecastViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/11.
//

import UIKit

class ForecastViewController: UIViewController {
	let forecastRepository = ForecastRepositoryImplemantation(forecastService: ForecastServiceImplementation())
	
	private lazy  var forecastViewModel =  ForecastViewModel(view: self,forecastRepository: forecastRepository)
	
	@IBOutlet weak var forecastTitle: UILabel!
	@IBOutlet weak var forecastCollectionView: UICollectionView!
	@IBOutlet weak var forecastActivityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var forecastLastUpdated: UILabel!
	@IBOutlet weak var forecastWeatherStation: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = .forecastNavTitle
		forecastCollectionView.delegate = self
		forecastCollectionView.dataSource = self
		forecastCollectionView.register(ForecastViewCell.self, forCellWithReuseIdentifier: .reuseIdentifier)
		forecastViewModel.forecastUIConfigration()
		forecastViewModel.fetchForecast()
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
		cell.forecastDateLabel.text = ConvertUTCDateToLocalDate(date: forecast.date ?? "")
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let forecastDetail = forecastViewModel.forecast?.forecasts[indexPath.row]
		let forecastdetailsViewController = ForecastDetailViewController(nibName: .forecastDetailViewControllerNibName, bundle: nil)
		forecastdetailsViewController.title = ConvertUTCDateToLocalDate(date: forecastDetail?.date ?? "")
		forecastdetailsViewController.humidity = forecastDetail?.humidity ?? 0
		forecastdetailsViewController.temp = forecastDetail?.temp ?? 0
		forecastdetailsViewController.safe = forecastDetail?.safe ?? false
		forecastdetailsViewController.windSpeed = forecastDetail?.windSpeed ?? 0
		forecastdetailsViewController.date = ConvertUTCDateToLocalDate(date: forecastDetail?.date ?? "")
		self.navigationController?.pushViewController(forecastdetailsViewController, animated: true)
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
		self.forecastLastUpdated.text = ConvertUTCDateToLocalDate(date: forecastViewModel.forecast?.lastUpdated ?? "")
		self.forecastWeatherStation.text = forecastViewModel.forecast?.weatherStation
	}
	
	func forecastDataFailureAlert() {
		let alert = UIAlertController(title: "Connection Failed!", message: "Something went wrong.\nTry Agian!", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Dismis", style: .cancel, handler: nil))
		self.present(alert, animated: true)
	}
}

