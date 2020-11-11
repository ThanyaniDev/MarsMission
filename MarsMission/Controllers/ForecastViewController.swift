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
	@IBOutlet weak var forecastCollectionView: UICollectionView!
	@IBOutlet weak var forecastActivityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var forecastLastUpdated: UILabel!
	@IBOutlet weak var forecastWeatherStation: UILabel!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = Keys.NavigationTitle.ForecastCollectionViewControllerTitle
		forecastCollectionView.delegate = self
		forecastCollectionView.dataSource = self
		forecastCollectionView.register(ForecastViewCell.self, forCellWithReuseIdentifier: Keys.Identifier.ReuseIdentifier)
		forecastViewModel.fetchForecast()
    }

}


extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return forecastViewModel.forecast?.forecasts.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Keys.Identifier.ReuseIdentifier, for: indexPath) as! ForecastViewCell
		guard let forecast =  forecastViewModel.forecast?.forecasts[indexPath.row] else {
			return cell
		}
		cell.forecastDateLabel.text = ConvertUTCDateToLocalDate(date: forecast.date ?? "")
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width - 250, height: 120)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return  UIEdgeInsets(top: 60, left: 10, bottom: 10, right: 10)
	}
}

extension ForecastViewController: ForecastView {
	func showForecastView() {
	}
	
	func hideForecastView() {
		
	}
	
	func showLoadingIndicator() {
		
	}
	
	func hideLoadingIndicator() {
	
	}
	
	func reloadForecastCollectionView() {
		self.forecastCollectionView.reloadData()
	}
}
