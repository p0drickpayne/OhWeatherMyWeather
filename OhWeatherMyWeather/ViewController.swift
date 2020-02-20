//
//  ViewController.swift
//  OhWeatherMyWeather
//
//  Created by Jakob Salomonsson on 2020-02-18.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var userName: String?
    var passWord: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(userName!)
        print(passWord!)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.yellow.cgColor,UIColor(named: "ColorOrange")?.cgColor as Any]
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        currentTemprature()
        //self.navigationController!.toolbar.barTintColor = UIColor(named: "ColorOrange")
        
        
    }
   // @IBAction func homeTapped(_ sender: Any) {
    func currentTemprature (){
               print("Get joke button pressed")
               let weather = WeatherAPI()
               weather.getCurrWeather { (result) in
                   switch result {
                   case .success(let myWeather):
                    print("Value: " + (String)(myWeather.main.temp))
                       DispatchQueue.main.async {
                           // Uppdatera UI
                        self.showTemp.text = "Temprature = \(myWeather.main.temp)"
                       }
                   case .failure(let error): print("Error \(error)")
                   }
               }
           
    }
    //}
    @IBOutlet weak var showTemp: UILabel!
    @IBAction func searhTapped(_ sender: Any) {
    }
    @IBAction func favsTapped(_ sender: Any) {
    }
    
    
}



