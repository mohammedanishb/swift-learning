//
//  WeatherResponse.swift
//  Weather
//
//  Created by Mohammed Anish B on 27/05/25.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let current: Current
    
    enum CodingKeys: String, CodingKey {
        case location
        case current
    }
}
