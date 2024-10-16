//
//  FilledListView.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 16/10/24.
//

import SwiftUI

// Enum to represent the selected types on segmented control
enum ExpenseType: String, CaseIterable {
    case personal = "Personal"
    case business = "Business"
}

struct FilledListView: View {
    var items: Expenses
    var action: () -> Void
    
    // State variable to track the selected segment
    @State private var selectedType: ExpenseType = .personal
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                if filteredItems.isEmpty {
                    ListEmptyView(action: action)
                } else {
                    List {
                        ForEach(filteredItems) { item in
                            // Main container
                            HStack (spacing: 12) {
                                // Type & information
                                VStack (alignment: .leading, spacing: 6) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.amount.formatted(.currency(code: "IDR")))
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(16)
                        }
                        .onDelete(perform: removeExpense)
                        .listRowInsets(EdgeInsets())
                    }
                    .scrollContentBackground(.hidden)
                    
                    HStack {
                        Button {
                            action()
                        } label: {
                            HStack (spacing: 12) {
                                Text("Add New Expense")
                                Image(systemName: "plus")
                            }
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                }
            }
            .navigationTitle("iExpenses")
            .toolbar {
                ToolbarItem (placement: .principal) {
                    Picker("Expense Type", selection: $selectedType) {
                        Text("Personal").tag(ExpenseType.personal)
                        Text("Business").tag(ExpenseType.business)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                    .transition(.slide)
                }
            }
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            .transition(.slide)
            .animation(.spring, value: selectedType)
        }
    }
    
    // Computed property for Item Filtering
    private var filteredItems: [ExpenseItem] {
        withAnimation {
            items.items.filter {
                $0.type == selectedType.rawValue
            }
        }
    }
    
    func removeExpense(at index: IndexSet) {
        items.items.remove(atOffsets: index)
    }
    
}

#Preview {
    FilledListView(items: Expenses(), action: {print("button pressed")} )
}
