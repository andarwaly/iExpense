//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//

import SwiftUI

// Conform the identifiable to make sure it will be identifiable
struct ExpenseItem: Identifiable {
    let id = UUID() // Auto generate unique ID
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}
