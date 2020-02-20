//
//  WeatherAPI.swift
//  OhWeatherMyWeather
//
//  Created by Jakob Salomonsson on 2020-02-19.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import Foundation

struct WeatherAPI {
    let baseURL: String = "https://api.openweathermap.org/data/2.5/weather?q=Goeteborg&appid=f5433b4eab9dc782b2a9babebc3b82ca"
    
    
    func getCurrWeather(completion: @escaping( Result<MainWeatherStruct, Error>) -> Void) {
        // url
        let urlString = baseURL
        guard let url: URL = URL(string: urlString) else { return }
        // Request
        print("Creating request..")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let unwrappedError = error {
                print("Nått gick fel. Error: \(unwrappedError)")
                completion(.failure(unwrappedError))
                return
            }
            if let unwrappedData = data {
                print("We got data! \(String(data: unwrappedData, encoding: String.Encoding.utf8) ?? "No data")")
                do {
                    let decoder = JSONDecoder()
                    let weather: MainWeatherStruct = try decoder.decode(MainWeatherStruct.self, from: unwrappedData)
                    print("Temp: \(weather.main.temp)")
                    
                    completion(.success(weather))
                } catch {
                    print("Couldnt parse JSON..")
                }
                
            }
        }
        // Starta task
        task.resume()
        print("Task started")
    }
    
}
