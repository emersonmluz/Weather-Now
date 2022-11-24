//
//  Weather.swift
//  clima-request
//
//  Created by Émerson M Luz on 24/11/22.
//

import Foundation

struct Weather: Decodable {
    var main: [String: Float]
    var wind: [String: Float]
    var id: Int
    var name: String
    var cod: Int
}
