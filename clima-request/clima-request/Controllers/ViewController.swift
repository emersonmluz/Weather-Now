//
//  ViewController.swift
//  clima-request
//
//  Created by Émerson M Luz on 24/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var grausLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weather = WeatherBrain()
    var city: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       weather.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchButtonClick(_ sender: UIButton) {
        guard searchTextField.text != nil && searchTextField.text != "" else {return}
        
        city = searchTextField.text!.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        
        weather.apiRequest(apiURL: "https://api.openweathermap.org/data/2.5/weather", appId: "aeefba332b49db396d425480b21571b2", units: "metric", city: city)
    }
    
    
}

extension ViewController: WeatherDelegate {
    func requestSuccess(weather: WeatherData) {
        DispatchQueue.main.async {
            self.grausLabel.text = String(weather.main["temp"]!)
            self.cityLabel.text = (weather.name)
        }
    }
    
    func requestFailed(error: Error) {
        print(error)
    }
}
