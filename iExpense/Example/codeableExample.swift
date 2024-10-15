//
//  codeableExample.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct JSONEncodingView: View {
    @State private var user = User(firstName: "Muhammad", lastName: "Dzaky")
    
    
    var body: some View {
        Text("Hello, World!")
        TextField("First Name", text: $user.firstName)
        TextField("Last Name", text: $user.lastName)
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    JSONEncodingView()
}
