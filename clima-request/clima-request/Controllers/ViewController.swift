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
    
    var weather: Weather?
    var city: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchButtonClick(_ sender: UIButton) {
        guard searchTextField.text != nil && searchTextField.text != "" else {return}
        
        city = ""
        
        for letter in searchTextField.text! {
            if letter == " " {
                city.append("%20")
            } else {
                city.append(letter)
            }
        }
        
        requestWeather()
    }
    
    func requestWeather () {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city),br&units=metric&appid=aeefba332b49db396d425480b21571b2")
        
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
                    self.grausLabel.text = String(self.weather!.main["temp"]!)
                    self.cityLabel.text = (self.weather!.name)
                }
            } catch let error {
                print(error)
            }
        }
        
        task.resume()
    }

}

