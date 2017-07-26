//
//  Service.swift
//  WeatherForecast
//
//  Created by Mont Leo on 25/07/2017.
//  Copyright © 2017 Mont Leo. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.darksky.net")
    
    static let sharedInstance = Service()
    
    func fetchWeather(completion: @escaping (CurrentWeather?, Error?) -> ()) {
        
        let request: APIRequest<CurrentWeather, JSONError> = tron.request("/forecast/33c371344898311931ea3058dcc4730f/37.8267,-122.4233")
        
        request.perform(withSuccess: { (weather) in
            print("Successfully get json")
            completion(weather, nil)
            
        }) { (err) in
            print("Failed to fetch json", err)
            completion(nil, err)
        }
    }
    
    
    class CurrentWeather: JSONDecodable {
        let weathers: Weather
        
        required init(json: JSON) throws {
            let itemJSON = json["currently"]
            let weather = Weather(json: itemJSON)
            
            self.weathers = weather
        }
    }
    
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error", json)
        }
    }
    
}




















