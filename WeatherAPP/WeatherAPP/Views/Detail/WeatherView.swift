//
//  WeatherView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 29.08.22.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
        }
        .overlay {
            NavigationBarView()
        }
        .navigationBarHidden(true)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
