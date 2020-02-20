//
//  GetWeather.swift
//  OhWeatherMyWeather
//
//  Created by Jakob Salomonsson on 2020-02-19.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import Foundation

struct MainWeatherStruct: Codable {
    let main: Main
}
struct Main: Codable {
    let temp: Double
    //let pressure: Double
    //let temp_min: Double
    //let temp_max: Double
}
