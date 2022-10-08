//
//  WeatherView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 29.08.22.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchableText = ""
    
    var filteredCities: [Forecast] {
        if searchableText.isEmpty {
            return Forecast.cities
        }
        return Forecast.cities.filter { $0.location.contains(searchableText) }
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(filteredCities) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay {
            NavigationBarView(searchableText: $searchableText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchableText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Please specify city")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
