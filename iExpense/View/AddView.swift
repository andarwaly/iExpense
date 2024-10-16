//
//  AddView.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//

import SwiftUI


struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types: [String: String] = [
        "Personal": "person.fill",
        "Business": "suitcase.fill"
    ]
    let orderedTypes = ["Personal", "Business"]
    
    // Pake environment, karena sheet di kontrol pada view yang beda
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            // Container
            VStack (spacing: 32) {
                // User input
                VStack (alignment: .leading, spacing: 16) {
                    // Expense name
                    VStack (alignment: .leading, spacing: 8){
                        Text("Expense Name")
                            .foregroundStyle(.secondary)
                        TextField("Your expense name", text: $name)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(6)
                            .shadow(color: .black.opacity(0.12), radius: 2)
                    }
                    Divider()
                    // Expense Type
                    HStack (spacing: 8) {
                        Text("Expense Type")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Picker("Type", selection: $type) {
                            ForEach(orderedTypes, id: \.self) { type in
                                HStack (spacing: 8) {
                                    Text(type)
                                    Image(systemName: types[type]!)
                                }
                                .tag(type)
                            }
                        }
                        
                    }
                    Divider()
                    // Expense Amount
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Amount")
                            .foregroundStyle(.secondary)
                        TextField("Amount", value: $amount, format: .currency(code: "IDR")) // make it dynamic depending on the user
                            .keyboardType(.decimalPad)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(6)
                            .shadow(color: .black.opacity(0.08), radius: 2)
                    }
                }
                .padding(16)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .black.opacity(0.12), radius: 2)
                .padding(.top, 16)
                
//                Spacer()
                
                // Save Button
                Button {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                    
                } label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
//                .padding(.bottom, 16)
            }
            .padding(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    HStack (alignment: .center) {
                        Text("Add Expense")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top, 12)
                        // Add space in between
                        Spacer()
                    }
                }
                ToolbarItem (placement: .topBarTrailing) {
                    // Close button
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 20 , height: 20)
                            .foregroundStyle(.gray.opacity(0.6))
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}


//// Input Form
//Form {
//    Section {
//        // Expense name
//        TextField("Your expense name", text: $name)
//            .padding(12)
//            .background(Color.white)
//            .cornerRadius(6)
//            .shadow(radius: 2)
//        // Expense Type
//        Picker("Type", selection: $type) {
//            ForEach(types, id: \.self) {
//                Text($0)
//            }
//        }
//        // Expense Amount
//        TextField("Amount", value: $amount, format: .currency(code: "IDR")) // make it dynamic depending on the user
//            .keyboardType(.decimalPad)
//    }
//    .listRowInsets(EdgeInsets())
//    .listRowSeparator(.hidden)
//    .listRowSpacing(16)
//    .listRowBackground(Color.white.opacity(0))
//}
//.scrollContentBackground(.hidden)
