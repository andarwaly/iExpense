//
//  ListEmptyView.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 16/10/24.
//

import SwiftUI

struct ListEmptyView: View {
    var action: () -> Void
    
    var body: some View {
        VStack (spacing: 32) {
            Image("EmptyState")
                .frame(width: 120, height: 120)
            
            // Copy Message
            VStack (spacing: 8) {
                // Title
                Text("No Expenses")
                    .font(.headline)
                // Message
                Text("There are no expenses to show. Start adding expenses to see them here.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
            
            // Action button
            Button {
                action()
            } label: {
                HStack (spacing: 12) {
                    Text("Add New Expense")
                    Image(systemName: "plus")
                }
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: 240)
                    .padding(.vertical, 14)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
            }
        }
    }
}

#Preview {
    ListEmptyView(action: {})
}
