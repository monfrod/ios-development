//
//  ContentView.swift
//  ViewAndModifier
//
//  Created by yunus on 08.02.2024.
//

import SwiftUI

struct TextModifier: View {
    var text: String
    var body: some View {
        Text(text)
            .padding()
            .background(.red)
    }
}
struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(.blue)
    }
}
extension View {
    func textmodifier() -> some View{
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        TextModifier(text: "Hello World")
        Text("Hello Swift")
            .textmodifier()
    }
}

#Preview {
    ContentView()
}
