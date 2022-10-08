//
//  SingleForecastItemView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 22.08.22.
//

import SwiftUI

struct SingleForecastItemView: View {
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    var isShown: Bool {
        var isRightNow = false
        if forecastPeriod == .hourly {
            isRightNow = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
        } else {
            isRightNow = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
        }
        return isRightNow
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isShown ? 1.0 : 0.2))
                .frame(width: 60, height: 146)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white.opacity(isShown ? 0.5 : 0.2))
                        .blendMode(.overlay)
                }
                .innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white.opacity(0.25), lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)

            VStack(spacing: 16) {
                Text(forecast.date, format: forecastPeriod == .hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))

                VStack(spacing: -4) {
                    Image("\(forecast.icon) small")

                    Text(forecast.probability, format: .percent)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.probabilityText)
                        .opacity(forecast.probability > 0 ? 1.0 : 0.0)
                }
                .frame(height: 42)

                Text("\(forecast.temperature)°")
                    .font(.title3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .frame(width: 60, height: 146)
        }
    }
}

struct SingleForecastItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleForecastItemView(forecast: .hourly[1], forecastPeriod: .hourly)
    }
}
