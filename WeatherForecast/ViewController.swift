//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Mont Leo on 25/07/2017.
//  Copyright © 2017 Mont Leo. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON


class ViewController: UIViewController {
    
    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_temp: UILabel!
    @IBOutlet weak var lbl_temp_scale: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        Service.sharedInstance.fetchWeather { (weather, err) in
            if let err = err {
                if let apiError = err as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 {
                        self.lbl_temp.text = "Status code was not 200"
                        self.lbl_temp.adjustsFontSizeToFitWidth = true
                        
                        return
                    }
                }
            }
            self.lbl_temp.text = weather?.weathers.temperature
            self.lbl_temp.adjustsFontSizeToFitWidth = true
        }
    }
}

















