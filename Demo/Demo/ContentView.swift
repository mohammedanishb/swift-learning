//
//  ContentView.swift
//  Demo
//
//  Created by Mohammed Anish B on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack{
                Image(systemName: "globe")
                    .resizable()
                    .frame(height: 120)
                    .frame(width: 120)
                    .foregroundStyle(.tint)
                Text("Just a Globe")
                    .padding()
                    .background(Color.white)
                    .font(.headline)
                    .border(.blue, width: 5)
                    
            }
            HStack {
                Spacer()
                Button("Button 1"){
                    
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                Button("Button 2"){
                    
                }
                .buttonStyle(.bordered)
                Spacer()
            }.padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
