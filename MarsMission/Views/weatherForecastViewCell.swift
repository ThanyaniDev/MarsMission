//
//  weatherForecastViewCell.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/07.
//

import UIKit

class weatherForecastViewCell: UICollectionViewCell {
	@IBOutlet weak var viewCell: UIView!
	@IBOutlet weak var temp: UILabel!
	
	let dateLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 25)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		let stackView = UIStackView(arrangedSubviews: [dateLabel])
		addSubview(stackView)
		stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20))
		stackView.axis = .vertical
		stackView.spacing = 10
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
