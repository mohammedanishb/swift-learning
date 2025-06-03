//
//  CustomViewModifierExample.swift
//  Advanced
//
//  Created by Mohammed Anish B on 03/06/25.
//

import Foundation
import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
}

struct CustomViewModifierExample: View {
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Hello, world!")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .orange)
            
            Text("Hello, everyone!")
                .font(.subheadline)
                .withDefaultButtonFormatting()

            Text("Hello!!!")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .red)
        }
        .padding()
    }
}

struct CustomViewModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifierExample()
    }
}
