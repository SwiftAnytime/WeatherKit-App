//
//  ContentView.swift
//  WeatherApp
//
//  Created by Krishna Babani on 8/3/22.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var weatherViewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        
        VStack {
//            HomeView(weather: weatherViewModel.currentWeather)
            HomeView()
        }
        .onAppear {
            Task {
//                await weatherViewModel.getWeather()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
