//
//  WeatherData.swift
//  clima-request
//
//  Created by Émerson M Luz on 30/11/22.
//

import Foundation

struct WeatherData: Codable {
    var main: [String: Float]
    var name: String
}
