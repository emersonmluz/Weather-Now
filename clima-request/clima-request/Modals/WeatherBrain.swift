//
//  Weather.swift
//  clima-request
//
//  Created by Émerson M Luz on 24/11/22.
//

import Foundation

protocol WeatherDelegate {
    func requestSuccess(weather: WeatherData)
    func decoderError()
}

struct WeatherBrain {
    var apiURL = "https://api.openweathermap.org/data/2.5/weather"
    var appId = "aeefba332b49db396d425480b21571b2"
    var units = "metric"
    var delegate: WeatherDelegate?
    
    func apiRequest (city: String) {
        
        let url = URL(string: "\(apiURL)?appid=\(appId)&units=\(units)&q=\(String(describing: city)),br")
        
        guard url != nil else {return}
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
    
        weatherDecoder(request: request)
    }
    
    func weatherDecoder (request: URLRequest) {
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in

            guard data != nil, error == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherData.self, from: data!)
                
                self.delegate?.requestSuccess(weather: weather)

            } catch {
                self.delegate?.decoderError()
                return
            }
        }
        
        task.resume()
    }
        
}
