//
//  ForecastView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 4.08.22.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationNormalized: CGFloat = 1
    @State private var tabSelection = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // TAB control
                SegmentedControlView(tabSelection: $tabSelection)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if tabSelection == 0 {
                            ForEach(Forecast.hourly) { forecast in
                                SingleForecastItemView(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -UIScreen.main.bounds.width - 5))
                        } else {
                            ForEach(Forecast.daily) { forecast in
                                SingleForecastItemView(forecast: forecast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: UIScreen.main.bounds.width + 5))
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationNormalized
                    )
                
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationNormalized)
        .overlay {
            // Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // Drag holder
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .preferredColorScheme(.dark)
    }
}
