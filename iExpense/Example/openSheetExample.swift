import SwiftUI

struct SheetExample: View {
    @State private var isSheetOpen = false
    
    var body: some View {
        Button("Open Sheet") {
            isSheetOpen.toggle()
        }
        .sheet(isPresented: $isSheetOpen) {
            // atau bisa masukin view disini
            Text("Hello, World!")
        }
    }
}

struct SheetContentEg: View {
    // Pake environment, karena sheet di kontrol pada view yang beda
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Second View")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
