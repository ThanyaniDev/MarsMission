//
//  ForecastsViewCell.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/09.
//

import UIKit

class ForecastViewCell: UICollectionViewCell {
	
	weak var forecastDateLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		let forecastLabel = UILabel()
		forecastLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(forecastLabel)
	
		NSLayoutConstraint.activate([
			forecastLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			forecastLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			forecastLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			forecastLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
		
		forecastDateLabel = forecastLabel
		
		contentView.backgroundColor = .systemGroupedBackground
		contentView.layer.cornerRadius = 25
		forecastDateLabel.textAlignment = .center
		forecastLabel.font = .systemFont(ofSize: 25)
		forecastLabel.numberOfLines = 2
		forecastLabel.textColor = .init(red: 50/255, green: 80/255, blue: 106/255, alpha: 0.8)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
