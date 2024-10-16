//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//

import SwiftUI

// Conform the identifiable to make sure it will be identifiable
struct ExpenseItem: Identifiable, Codable {
    var id = UUID() // Auto generate unique ID
    let name: String
    let type: String
    let amount: Double
}


class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        // Cek item yang sudah disimpan
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // kalo ada coba di decode
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // set array item -> decodedItem dari save2an
                items = decodedItems

                return
            }
        }
        // kalo gagal bikin empty array
        items = []

    }
}
