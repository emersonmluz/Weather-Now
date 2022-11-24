//
//  ViewController.swift
//  clima-request
//
//  Created by Émerson M Luz on 24/11/22.
//

import UIKit

class ViewController: UIViewController {

    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestWeather()
        // Do any additional setup after loading the view.
    }

    func requestWeather () {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Porto%20Alegre,br&units=metric&appid=aeefba332b49db396d425480b21571b2")
        
        guard url != nil else {return}
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            guard data != nil, error == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                self.weather = try decoder.decode(Weather.self, from: data!)
                
                DispatchQueue.main.async {
                    print (self.weather!)
                }
            } catch let error {
                print(error)
            }
        }
        
        task.resume()
    }

}

