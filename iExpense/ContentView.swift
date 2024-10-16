//
//  ContentView.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch expenses.items.isEmpty {
                case true:
                    ListEmptyView(action: showAddExpense)
                        .navigationTitle("iExpenses")
                case false:
                    VStack {
                        List {
                            ForEach(expenses.items) { item in  // does't need ID -> already conform to identifiable
                                Text(item.name)
                            }
                            .onDelete(perform: removeExpense)
                        }
                        .navigationTitle("iExpenses")
                        .toolbar {
                            Button("Add Expense", systemImage: "plus") {
                                showingAddExpense = true
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
                .presentationDetents([.medium])
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
        .animation(.spring(duration: 0.35, bounce: 0.6), value: expenses.items.isEmpty)
    }
    
    func showAddExpense() {
        showingAddExpense = true
    }
    
    // Delete Function
    func removeExpense(at index: IndexSet) {
        expenses.items.remove(atOffsets: index)
    }
}


#Preview {
    ContentView()
}
