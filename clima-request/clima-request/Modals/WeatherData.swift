//
//  WeatherData.swift
//  clima-request
//
//  Created by Émerson M Luz on 30/11/22.
//

import Foundation

struct WeatherData: Codable {
    var sky: [Sky]
    var main: [String: Float]
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case sky = "weather"
        case main
        case name
    }
}
