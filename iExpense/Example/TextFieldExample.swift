//
//  TextFieldExample.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//

import SwiftUI

struct CurrencyTextField: View {
    // State variables to store the amount and the selected currency
    @State private var amount: String = ""
    @State private var selectedCurrency: String = "USD"
    
    // List of supported currencies (you can expand this list as needed)
    let currencies = ["USD", "EUR", "GBP", "JPY", "AUD"]
    
    var body: some View {
        HStack {
            // Currency picker
            Picker(selection: $selectedCurrency, label: Text("")) {
                ForEach(currencies, id: \.self) { currency in
                    Text(currency).tag(currency)
                }
            }
            .pickerStyle(MenuPickerStyle()) // Display the picker as a menu for compact UI

            // Custom TextField for the amount
            TextField("Enter amount", text: $amount)
                .keyboardType(.decimalPad) // Use a numeric keyboard for input
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .multilineTextAlignment(.leading)
                .onChange(of: amount) { oldValue, newValue in
                    // Optional: Format the text as the user types
                    formatAmountInput()
                }

            // Display the currency symbol
            Text(currencySymbol(for: selectedCurrency))
                .foregroundColor(.gray)
        }
        .padding()
    }
    
    // Helper function to format the amount input (Optional)
    private func formatAmountInput() {
        // Example logic: Remove non-numeric characters and keep the decimal point
        let filtered = amount.filter { "0123456789.".contains($0) }
        if filtered != amount {
            amount = filtered
        }
    }
    
    // Helper function to get the currency symbol based on the selected currency
    private func currencySymbol(for currency: String) -> String {
        switch currency {
        case "USD": return "$"
        case "EUR": return "€"
        case "GBP": return "£"
        case "JPY": return "¥"
        case "AUD": return "A$"
        default: return ""
        }
    }
}

struct TextFieldExample: View {
    var body: some View {
        CurrencyTextField()
    }
}

#Preview {
    TextFieldExample()
}
