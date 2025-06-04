//
//  GeometryPreferenceKeyExample.swift
//  Advanced
//
//  Created by Mohammed Anish B on 04/06/25.
//

import SwiftUI

struct GeometryPreferenceKeyExample: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            Spacer()
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .overlay(content: {
                            Text("\(geo.size.width) x \(geo.size.height)")
                                .foregroundStyle(.white)
                        })
                        .updateRectangleGeoSize(geo.size)
                }
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self, perform: { value in
            self.rectSize = value
        })
    }
}

struct GeometryPreferenceKeyExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyExample()
    }
}

extension View {
    
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
}
