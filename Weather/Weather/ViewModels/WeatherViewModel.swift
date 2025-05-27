//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Mohammed Anish B on 27/05/25.
//

import Combine

class WeatherViewModel: ObservableObject {
    private let weatherService = WeatherService()
    
    @Published var city: String = "New York"
    @Published var weather: WeatherResponse?
    @Published var isLoading: Bool = true
    @Published var error: Error?
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    func fetchWeather() {
        weatherService.fetchWeather(for: city)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    print(error)
                    self?.error = error
                }
            }, receiveValue: { [weak self] weather in
                self?.weather = weather
            })
            .store(in: &cancellables)
    }
    
}
