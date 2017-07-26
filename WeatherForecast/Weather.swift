//
//  Weather.swift
//  WeatherForecast
//
//  Created by Mont Leo on 25/07/2017.
//  Copyright © 2017 Mont Leo. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Weather {
    let temperature: String
    let summary: String
    
    init(json: JSON) {
        self.temperature = json["temperature"].stringValue
        self.summary = json["summary"].stringValue
    }
}


