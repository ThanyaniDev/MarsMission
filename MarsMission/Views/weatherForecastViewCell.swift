//
//  weatherForecastViewCell.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/07.
//

import UIKit

class weatherForecastViewCell: UICollectionViewCell {
	
	let dateLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize:20)
		label.numberOfLines = 1
		label.textColor = .white
		return label
	}()
	
	let tempLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize:20)
		label.numberOfLines = 1
		label.textColor = .white
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		let stackView = UIStackView(arrangedSubviews: [dateLabel,tempLabel])
		addSubview(stackView)
		stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 20))
		stackView.axis = .vertical
		stackView.spacing = 10
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
