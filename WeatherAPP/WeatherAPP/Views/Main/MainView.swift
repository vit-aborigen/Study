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
    @State private var bottomSheetTranslation: CGFloat = BottomSheetPositions.middle.rawValue
    @State private var isBottomSheetRolledOut = false
    
    var bottomSheetTranslationNormalized: CGFloat {
        (bottomSheetTranslation - BottomSheetPositions.middle.rawValue) / (BottomSheetPositions.top.rawValue - BottomSheetPositions.middle.rawValue)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenHeight = geo.size.height + geo.safeAreaInsets.top + geo.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationNormalized * imageOffset)
                    
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationNormalized * imageOffset)
                    
                    VStack(spacing: -10 * (1 - bottomSheetTranslationNormalized)) {
                        Text("Default city")
                            .font(.largeTitle)
                        
                        VStack {
                            Text(attributedString)
                            
                            Text("H:30°\tL:20°")
                                .font(.title3).fontWeight(.semibold)
                                .opacity(1 - bottomSheetTranslationNormalized)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationNormalized * 46)
                    
                    BottomSheetView(position: $bottomSheetPosition) {
                        // 2do
                    } content: {
                        ForecastView(bottomSheetTranslationNormalized: bottomSheetTranslationNormalized)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        withAnimation(.easeInOut) {
                            isBottomSheetRolledOut = bottomSheetPosition == BottomSheetPositions.top ? true : false
                        }
                    }

                    TabBarView(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationNormalized * 115)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private var attributedString: AttributedString {
        let stringFromInternet = "23°" + "\(isBottomSheetRolledOut ? " | " : "\n ")" + "Mostly Clear"
        var fullString = AttributedString(stringFromInternet)
        
        let separator: Character = "\n"
        guard stringFromInternet.firstIndex(of: separator) != nil else {
            return AttributedString("Failed to get data")
        }
        
        let weatherState = stringFromInternet.split(separator: separator)
        
        if let temperatureRange = fullString.range(of: weatherState[0]) {
            fullString[temperatureRange].font = .system(size: (96 - (bottomSheetTranslationNormalized * (96 - 20))), weight: isBottomSheetRolledOut ? .semibold : .thin)
            fullString[temperatureRange].foregroundColor = isBottomSheetRolledOut ? .secondary : .primary
        }
        
        if let weatherRange = fullString.range(of: weatherState[1]) {
            fullString[weatherRange].font = .title3.weight(.semibold)
            fullString[weatherRange].foregroundColor = .secondary.opacity(bottomSheetTranslationNormalized)
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
