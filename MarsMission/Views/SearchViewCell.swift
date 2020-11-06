//
//  SearchViewCell.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/05.
//

import UIKit

class SearchViewCell: UICollectionViewCell {
	
	private lazy  var viewModel =  WeatherDataViewModel(view: self)
	
	let solLabel: UILabel = {
		let label = UILabel()
		label.text = "SOL : 689"
		label.textAlignment = .center
		label.font = .systemFont(ofSize:40)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	let dateLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.text = "NOV 05"
		label.font = .systemFont(ofSize: 20)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	let hignLabel: UILabel = {
		let label = UILabel()
		label.text = "High : 67.32 F"
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 25)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	let lowLabel: UILabel = {
		let label = UILabel()
		label.text = "Low : -43.32 F"
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 25)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		viewModel.gettingWeatherData()
		let stackView = UIStackView(arrangedSubviews: [solLabel,dateLabel,hignLabel,lowLabel])
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
	func populateWeatherData(_ mn: String) {
		self.lowLabel.text = mn
	}
}
