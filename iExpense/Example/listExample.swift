//
//  listExample.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 15/10/24.
//

import SwiftUI

struct listExample: View {
    @State private var numbers = [Int]()
    @State private var currentNumber: Int = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row #\($0)")
                    }
                    .onDelete(perform: removeRow)
                }
                Button("New Row") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRow(at index: IndexSet) {
        numbers.remove(atOffsets: index)
    }
}

#Preview {
    listExample()
}
