//
//  ContentView.swift
//  Counter
//
//  Created by Mohammed Anish B on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(Font.title)
                .padding()
            HStack {
                Spacer()
                Button("Increment") {
                    count += 1
                }
                Spacer()
                Button("Decrement") {
                    count -= 1
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
