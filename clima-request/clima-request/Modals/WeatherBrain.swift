//
//  Weather.swift
//  clima-request
//
//  Created by Émerson M Luz on 24/11/22.
//

import Foundation

protocol WeatherDelegate {
    func requestSuccess(weather: WeatherData)
    func requestFailed(error: Error)
}

struct WeatherBrain {
    var delegate: WeatherDelegate?
    
    func apiRequest (apiURL: String, appId: String, units: String, city: String) {
        
        let url = URL(string: "\(apiURL)?appid=\(appId)&units=\(units)&q=\(String(describing: city)),br")
        
        guard url != nil else {return}
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            guard data != nil, error == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherData.self, from: data!)
                
                self.delegate?.requestSuccess(weather: weather)

            } catch let error {
                self.delegate?.requestFailed(error: error)
                return
            }
        }
        
        task.resume()
    }
        
}
