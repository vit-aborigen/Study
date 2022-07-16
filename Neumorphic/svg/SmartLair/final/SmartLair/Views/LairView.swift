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

struct LairView: View {
  
  init() {
    UINavigationBar.appearance().largeTitleTextAttributes =
      [.foregroundColor: UIColor.lairDarkGray]
  }
  
  var profileView: some View {
    LinearGradient.lairHorizontalDark
      .frame(width: 22, height: 22)
      .mask(
        Image(systemName: "person.crop.circle")
          .resizable()
          .scaledToFit()
    )
      .padding()
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        Color.lairBackgroundGray.edgesIgnoringSafeArea(.all)
        VStack(spacing: 30) {
          AccessoryRowView(items: [
            AccessoryView(
              title: "Control Room Lights",
              image: Image(systemName: "lightbulb")),
            AccessoryView(
              title: "Dungeon",
              image: Image(systemName: "lock.shield")),
            AccessoryView(
              title: "Death Ray",
              image: Image(systemName: "scope")),
            AccessoryView(
              title: "Periscope",
              image: Image(systemName: "eye")),
            AccessoryView(
              title: "Evil Music",
              image: Image(systemName: "music.house"))
          ])
          ProgressBarView(
            title: "Death Ray Charge",
            percent: .constant(0.42)).frame(height: 50)
          ProgressBarView(
            title: "Weather Machine Construction",
            percent: .constant(0.86)).frame(height: 50)
        }
        .navigationBarTitle(Text("Lair"))
        .navigationBarItems(trailing: profileView)
      }
    }
  }
}

struct LairView_Previews: PreviewProvider {
  static var previews: some View {
    LairView()
  }
}
