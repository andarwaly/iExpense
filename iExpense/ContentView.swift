//
//  ContentView.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//
import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeExpense)
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Test Expense", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
        }
    }
    
    // Delete Function
    func removeExpense(at index: IndexSet) {
        expenses.items.remove(atOffsets: index)
    }
}


#Preview {
    ContentView()
}
