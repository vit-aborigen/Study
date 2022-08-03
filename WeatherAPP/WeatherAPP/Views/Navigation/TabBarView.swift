//
//  TabBarView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 3.08.22.
//

import SwiftUI

struct TabBarView: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 22))
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(action: {})
            .preferredColorScheme(.dark)
    }
}
