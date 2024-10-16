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
                case false:
                    FilledListView(items: expenses, action: showAddExpense)
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
//                .presentationSizing(.fitted)
                .presentationDetents([.medium])
                .presentationContentInteraction(.scrolls)
                .presentationCornerRadius(20)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
        .animation(.spring(duration: 0.35, bounce: 0.6), value: expenses.items.isEmpty)
    }
    
    func showAddExpense() {
        withAnimation (.spring(duration: 0.25, bounce: 0.6)) {
            showingAddExpense = true
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
