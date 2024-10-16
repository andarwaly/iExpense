

import SwiftUI

struct NotEmptyView: View {
    var action: () -> Void
    
    var body: some View {
        Text("Empty View")
        Button("Tap Me") {
            action()
        }
    }
}

struct ViewView: View {
    @State private var tapCount: Int = 0
    
    var body: some View {
        Text("Total Count: \(tapCount)")
        NotEmptyView(action: addTap)
    }
    
    func addTap() {
        tapCount += 1
    }
}


#Preview {
    ViewView()
}
