/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct TabBarItemView: View {
  @Binding var selectedItem: SmartView
  
  let uuid = UUID()
  var smartView: SmartView
  var icon: String
  
  let size: CGFloat = 32
  func isSelected() -> Bool {
    return selectedItem == smartView
  }
  
  var body: some View {
    Button(action: {
      self.selectedItem = self.smartView
    }) {
      if isSelected() {
        buttonDown
      } else {
        buttonUp
      }
    }
  }
  
  var buttonUp: some View {
    var buttonMask: some View {
      ZStack {
        Rectangle()
          .foregroundColor(.white)
          .frame(width: size * 2, height: size * 2)
        Image(systemName: self.icon)
          .resizable()
          .scaledToFit()
          .frame(width: size, height: size)
      }
    }
    
    var button: some View {
      ZStack {
        LinearGradient.lairHorizontalDarkReverse
          .frame(width: size, height: size)
        Rectangle()
          .inverseMask(buttonMask)
          .frame(width: size * 2, height: size * 2)
          .foregroundColor(.lairBackgroundGray)
          .shadow(color: .lairShadowGray, radius: 3, x: 3, y: 3)
          .shadow(color: .white, radius: 3, x: -3, y: -3)
          .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
      }
      .compositingGroup()
      .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
      .shadow(color: Color.lairShadowGray.opacity(0.5), radius: 10, x: 5, y: 5)
    }
    
    return button
  }
  
  var buttonDown: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.lairBackgroundGray)
        .frame(width: size * 2.25, height: size * 2.25)
        .cornerRadius(size * 8 / 16)
      
      Rectangle()
        .foregroundColor(.lairBackgroundGray)
        .frame(width: size * 2.25, height: size * 2.25)
        .cornerRadius(size * 8 / 16)
        .inverseMask(Rectangle()
          .cornerRadius(size * 6 / 16)
          .padding(size / 8)
      )
        .shadow(
          color: Color.lairShadowGray.opacity(0.7),
          radius: size * 0.1875,
          x: size * 0.1875, y: size * 0.1875)
        .shadow(
          color: Color(white: 1.0).opacity(0.9),
          radius: size * 0.1875,
          x: -size * 0.1875, y: -size * 0.1875)
        .clipShape(RoundedRectangle(cornerRadius: size * 8 / 16))
      
      LinearGradient.lairHorizontalDarkReverse
        .frame(width: size, height: size)
        .mask(Image(systemName: self.icon)
          .resizable()
          .scaledToFit()
      )
        .shadow(
          color: Color.lairShadowGray.opacity(0.5),
          radius: size * 0.1875,
          x: size * 0.1875, y: size * 0.1875)
        .shadow(
          color: Color(white: 1.0).opacity(0.9),
          radius: size * 0.1875,
          x: -size * 0.1875, y: -size * 0.1875)
    }
    .overlay(
      RoundedRectangle(cornerRadius: size * 8 / 16)
        .stroke(LinearGradient.lairDiagonalLightBorder, lineWidth: 2)
    )
  }
}

struct TabBarItemView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarItemView(
      selectedItem: .constant(SmartView.lair),
      smartView: .lair, icon: "pencil.tip")
  }
}
