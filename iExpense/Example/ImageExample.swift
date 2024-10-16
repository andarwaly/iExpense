//
//  ImageExample.swift
//  iExpense
//
//  Created by Muhammad Dzaky on 16/10/24.
//

import SwiftUI

struct ImageExample: View {
    // Define a dictionary that maps types to their corresponding image names
    let types: [String: String] = [
        "Personal": "person.fill",
        "Business": "suitcase.fill"
    ]
    
    // State variable to track the selected type
    @State private var selectedType: String = "Personal"
    
    var body: some View {
        VStack {
            // Create a picker for the types that shows images instead of text
            Picker(selection: $selectedType, label: HStack {
//                Image(systemName: types[selectedType]!)
//                    .foregroundColor(.blue) // Customize icon color
                Text(selectedType)
                    .foregroundColor(.blue) // Customize text color
            }.padding(.trailing, 10)) {
                ForEach(types.keys.sorted(), id: \.self) { type in
                    // Show image for each type
                    HStack (spacing: 8){
                        Text(type)
                        Image(systemName: types[type]!)
                    }
                    .tag(type) // Associate each image with a tag (the type name)
                }
            }
            
            // Show the corresponding image for the selected type
            if let imageName = types[selectedType] {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageExample()
    }
}
