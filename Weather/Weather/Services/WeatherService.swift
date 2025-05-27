//
//  WeatherService.swift
//  Weather
//
//  Created by Mohammed Anish B on 27/05/25.
//

import Foundation
import Combine

class WeatherService {
    private let apiKey = "954ee9500402430ab8161351252705"
    
    func fetchWeather(for city: String) -> AnyPublisher<WeatherResponse, Error> {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
