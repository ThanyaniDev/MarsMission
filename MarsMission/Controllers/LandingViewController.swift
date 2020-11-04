//
//  LandingViewController.swift
//  MarsMission
//
//  Created by Thanyani on 2020/11/03.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var dailyWeatherReport: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Mars Mission"
        dailyWeatherReport.layer.cornerRadius = 30
        showData()
        
    }
}




extension  LandingViewController:  LandingView {
    
    
    func showData() {
        let data = GetData().atmosphericTemperatureData
        print(data)
    }
    
    @IBAction func didTapDailyWeatherReport(_ sender: Any) {
        navigationController?.pushViewController(DetailsViewController(nibName: keys.nibName.weatherDetails, bundle: nil), animated: true)
      
    }
    
}


