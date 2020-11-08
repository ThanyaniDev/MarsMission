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
	
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(viewCell)
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
