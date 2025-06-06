//
//  ButtonStyleExample.swift
//  Advanced
//
//  Created by Mohammed Anish B on 03/06/25.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            //.brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
    
}

extension View {
    
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
    
}

struct ButtonStyleExample: View {
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("Click Me")
                .font(.headline)
                .withDefaultButtonFormatting()
        })
        .withPressableStyle(scaledAmount: 0.9)
        .padding(40)
    }
}

struct ButtonStyleExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleExample()
    }
}
