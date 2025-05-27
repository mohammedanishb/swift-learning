//
//  ContentView.swift
//  Weather
//
//  Created by Mohammed Anish B on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            TextField("City", text: $viewModel.city, onCommit: {
                viewModel.fetchWeather()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.error != nil {
                Text("Error: \(viewModel.error!)")
            } else if let weatherData = viewModel.weather {
                Text("\(weatherData.location.name), \(weatherData.location.country)")
                Text("\(weatherData.current.tempC)°C")
            } else {
                Text("No data found")
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchWeather()
        }
    }
}

#Preview {
    ContentView()
}
