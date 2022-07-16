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

struct ProgressBarView: View {
  var title: String
  @Binding var percent: Double
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HStack {
          Text(self.title)
            .foregroundColor(.lairDarkGray)
            .bold()
          Spacer()
          Text("\(Int(self.percent * 100))%")
            .foregroundColor(.lairDarkGray)
            .bold()
        }
        ZStack(alignment: .leading) {
          ZStack {
            Capsule()
              .frame(height: 14)
              .foregroundColor(Color(white: 0.8))
            LinearGradient.lairHorizontalDarkToLight
              .frame(height: 14)
              .mask(Capsule())
              .opacity(0.7)
          }
          
          ZStack {
            LinearGradient.lairHorizontalLight
              .frame(
                width: (geometry.size.width - 32) * CGFloat(self.percent),
                height: 10)
              .mask(
                Capsule()
                  .padding(.horizontal, 2)
            )
            LinearGradient.lairVerticalLightToDark
              .frame(
                width: (geometry.size.width - 32) * CGFloat(self.percent),
                height: 10)
              .mask(
                Capsule()
                  .padding(.horizontal, 2)
            )
              .opacity(0.7)
          }
          .shadow(color: Color.lairShadowGray.opacity(0.5), radius: 2, x: 0, y: 1)
        }
        .clipShape(Capsule())
      }
      .padding(.horizontal)
    }
  }
}

struct ProgressBarView_Previews: PreviewProvider {
  static var previews: some View {
    ProgressBarView(title: "Laser Charge", percent: .constant(0.42))
  }
}
