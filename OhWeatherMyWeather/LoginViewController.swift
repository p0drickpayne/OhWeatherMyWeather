//
//  LoginViewController.swift
//  OhWeatherMyWeather
//
//  Created by Jakob Salomonsson on 2020-02-18.
//  Copyright © 2020 Jakob Salomonsson. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginTapped(_ sender: Any) {
        navigateToMainInterface()
    }
    private func navigateToMainInterface () {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let mainNavigationVC = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as? MainNavigationController else{
            return
        }
        
        print(mainNavigationVC.topViewController)
        print(mainNavigationVC.viewControllers)
        
        if let mainVC = mainNavigationVC.topViewController as? ViewController {
            
            mainVC.userName = userNameTextfield.text
            mainVC.passWord = passwordTextfield.text
            
        }
        
        present(mainNavigationVC, animated: true, completion: nil)
    }
    
}
