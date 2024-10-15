//
//  appStorageExample.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//

import SwiftUI

struct AppStorageExample: View {
    // Bisa juga menggunakan @AppStorage untuk case simpel, dan menghilangkan semua UserDefaults
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Add Count: \(tapCount)") {
            tapCount += 1
            
            // Store the latest updated count by the user.
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}
