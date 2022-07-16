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

struct AccessoryView: View {
  let uuid = UUID()
  var title: String
  var image: Image
  
  var body: some View {
    VStack {
      LinearGradient.lairHorizontalDark
        .mask(image.resizable().scaledToFit())
        .frame(width: 150, height: 236)
        .padding(40)
        .font(.system(size: 150, weight: .thin))
        .shadow(color: .white, radius: 2, x: -3, y: -3)
        .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
      
      HStack {
        Text(title)
          .foregroundColor(.lairDarkGray)
          .bold()
          .padding(.leading)
          .padding(.bottom)
        Spacer()
      }
    }
    .frame(width: 230)
    .overlay(
      RoundedRectangle(cornerRadius: 15)
        .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
    )
      .background(Color.lairBackgroundGray)
      .cornerRadius(15)
      .shadow(color: Color(white: 1.0).opacity(0.9), radius: 18, x: -18, y: -18)
      .shadow(color: Color.lairShadowGray.opacity(0.5), radius: 14, x: 14, y: 14)
  }
}

struct AccessoryView_Previews: PreviewProvider {
  static var previews: some View {
    AccessoryView(title: "Control Room", image: Image(systemName: "lock.shield"))
  }
}
