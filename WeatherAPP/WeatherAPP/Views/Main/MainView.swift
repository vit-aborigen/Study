//
//  MainView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 2.08.22.
//

import BottomSheet
import SwiftUI

struct MainView: View {
    @State private var bottomSheetPosition: BottomSheetPositions = .middle
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)
                
                VStack(spacing: -10) {
                    Text("Default city")
                        .font(.largeTitle)
                    
                    VStack {
                        Text(attributedString)
                        
                        Text("H:30°\tL:20°")
                            .font(.title3).fontWeight(.semibold)
                    }
                    
                    Spacer()
                }
                .padding(.top, 51)
                
                BottomSheetView(position: $bottomSheetPosition) {
                    // 2do
                } content: {
                    ForecastView()
                }

                TabBarView(action: {
                    bottomSheetPosition = .top
                })
            }
            .navigationBarHidden(true)
        }
    }
    
    private var attributedString: AttributedString {
        let stringFromInternet = "23°\nMostly Clear"
        var fullString = AttributedString(stringFromInternet)
        
        let separator: Character = "\n"
        guard stringFromInternet.firstIndex(of: separator) != nil else {
            return AttributedString("Failed to get data")
        }
        
        let weatherState = stringFromInternet.split(separator: separator)
        
        if let temperatureRange = fullString.range(of: weatherState[0]) {
            fullString[temperatureRange].font = .system(size: 96, weight: .thin)
            fullString[temperatureRange].foregroundColor = .primary
        }
        
        if let weatherRange = fullString.range(of: weatherState[1]) {
            fullString[weatherRange].font = .title3.weight(.semibold)
            fullString[weatherRange].foregroundColor = .secondary
        }
        
        return fullString
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
