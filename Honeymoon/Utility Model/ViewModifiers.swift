//
//  ViewModifiers.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
 

struct DismissButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Capsule().fill(Color.pink)
            )
            .foregroundColor(.white)
    }
}


struct CardMarkModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 200)
            .foregroundColor(.white)
            .font(.system(size: 128, weight: .bold, design: .rounded))
            .shadow(color: .black, radius: 10, x: 2, y: 2)
    }
}

struct StrokeButtonModifier: ViewModifier {
    var strokeWidth: CGFloat?
    func body(content: Content) -> some View {
        content
            .font(.system(.subheadline, design: .rounded))
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .accentColor(.pink)
            .background(
                Capsule().stroke(Color.pink, lineWidth: 2).frame(width: strokeWidth, alignment: .center).shadow(color: .white, radius: 1, x: 0, y: 0)
            )
    }
}

struct TextfieldViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.horizontal)
            .frame(height: 30, alignment: .center)
            .shadow(radius: 20)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .overlay(Capsule().stroke().foregroundColor(.pink))
            .padding(.horizontal)
    }
}
