//
//  WeatherDetailViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/04.
//

import UIKit

class WeatherDetailViewController: UIViewController {
	
    @IBOutlet weak var high: UILabel!
    @IBOutlet weak var low: UILabel!
    
    private lazy var viewModel = WeatherDataViewModel(view: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = keys.navigationTitle.detailsViewtitle
    }
}

extension WeatherDetailViewController: WeatherDetailView {
    
    func populateData(_ minValue: String, _ maxValue: String) {
        self.high.text = maxValue
        self.low.text = minValue
    }
    
}
