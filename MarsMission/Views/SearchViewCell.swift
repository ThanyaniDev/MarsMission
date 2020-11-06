//
//  SearchViewCell.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import UIKit

class SearchViewCell: UICollectionViewCell {
	
	private lazy  var viewModel =  WeatherDataViewModel(view: self)
	
	let weatherStationLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize:40)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	let lastUpdatedLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	let dateLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 25)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	let tempLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 25)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	let windSpeedLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 25)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
//	let safeLabel: Bool = {
//		let label = Bool()
//		label.textAlignment = .center
//		label.font = .systemFont(ofSize: 25)
//		label.numberOfLines = 0
//		label.textColor = .white
//		return Bool
//	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		viewModel.fetchWeatherData()
		let stackView = UIStackView(arrangedSubviews: [weatherStationLabel,dateLabel,lastUpdatedLabel,tempLabel,windSpeedLabel])
		addSubview(stackView)
		stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20))
		stackView.axis = .vertical
		stackView.spacing = 10
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension SearchViewCell: WeatherView {
//	func populateWeatherData(_ lastUpdated: String,_ weatherStation: String, _ date: String,_ temp: Double,_ humidity: Int,_ windSpeed: Int,_ safe: Bool) {
//		self.lastUpdatedLabel.text = lastUpdated
//	}
	func populateWeatherData(_ lastUpdated: String) {
		self.lastUpdatedLabel.text = lastUpdated
	}
}
