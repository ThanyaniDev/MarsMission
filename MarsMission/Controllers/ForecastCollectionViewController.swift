//
//  LandingCollectionViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/09.
//

import UIKit

class ForecastCollectionViewController: UICollectionViewController {
	private lazy  var forecastViewModel =  ForecastViewModel(view: self)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = Keys.NavigationTitle.ForecastCollectionViewControllerTitle
		collectionView.register(ForecastViewCell.self, forCellWithReuseIdentifier: Keys.Identifier.ReuseIdentifier)
		forecastViewModel.fetchForecast()
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return forecastViewModel.forecast?.forecasts.count ?? 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Keys.Identifier.ReuseIdentifier, for: indexPath) as! ForecastViewCell
		guard let forecast =  forecastViewModel.forecast?.forecasts[indexPath.row] else {
			return cell
		}
		cell.forecastDateLabel.text = ConvertUTCDateToLocalDate(date: forecast.date ?? "")
		return cell
	}
}

extension ForecastCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.size.width - 250, height: 120)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return  UIEdgeInsets(top: 160, left: 10, bottom: 150, right: 10)
	}
}

extension ForecastCollectionViewController: ForecastView {
	func reloadForecastCollectionView() {
		self.collectionView.reloadData()
	}
}
