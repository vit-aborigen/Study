import UIKit
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    let text: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}

struct ContentView: View {
    @State private var textToShare: String = "Use HoroApp!"
    @State private var showShareSheet = false
    
    var body: some View {
        VStack {
            Button("Show Activity View") {
                showShareSheet = true
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ActivityView(text: textToShare)
        }
    }
}
