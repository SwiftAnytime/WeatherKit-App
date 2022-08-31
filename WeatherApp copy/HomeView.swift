//
//  HomeView.swift
//  WeatherApp
//
//  Created by Krishna Babani on 8/3/22.
//

import SwiftUI

struct HomeView: View {
    
//    let weather: Weather

    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [Color(.systemBlue), Color(.systemTeal)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {

                VStack(spacing: 3) {
                    
//                    Image(systemName: weather.symbolName)
                    Image(systemName: "sun.max")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 40)
                    
                    Text("San Francisco")
                        .font(.system(size: 44))
                        .fontWeight(.bold)

//                    Text(String(format: "%.0f", weather.temperature) + "°C")
                    Text("30 °C")
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                    
//                    Text(weather.condition.capitalizingFirstLetter())
                    Text("Clear")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                    
                }
            }
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
