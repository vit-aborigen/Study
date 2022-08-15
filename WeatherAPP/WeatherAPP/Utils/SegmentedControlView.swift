//
//  SegmentedControlView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 15.08.22.
//

import SwiftUI

struct SegmentedControlView: View {
    @Binding var tabSelection: Int

    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        tabSelection = 0
                    }
                } label: {
                    Text("Hourly forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)

                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        tabSelection = 1
                    }
                } label: {
                    Text("Weekly forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)

            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
                .blendMode(.overlay)
                .overlay {
                    HStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underline)
                            .blendMode(.overlay)
                    }
                    .frame(maxWidth: .infinity, alignment: tabSelection == 0 ? .leading : .trailing)
                    .offset(x: -1)
                }
        }
        .padding(.top, 25)
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(tabSelection: .constant(0))
    }
}
