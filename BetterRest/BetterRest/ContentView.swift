//
//  ContentView.swift
//  BetterRest
//
//  Created by yunus on 04.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUP = Date.now
    
    var body: some View {
        VStack {
            DatePicker("Please enter date", selection: $wakeUP, in: Date.now...)
                .labelsHidden()
        }
    }
}

#Preview {
    ContentView()
}
