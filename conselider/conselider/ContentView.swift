//
//  ContentView.swift
//  conselider
//
//  Created by yunus on 12.02.2024.
//

import SwiftUI

struct ContentView: View {
    let threeValue = ["Rock", "Paper", "Scissors"]
    @State private var enemyAnswer = 0
    @State private var myAnswer = "Rock"
    @State private var result = ""
    
    func getResult() {
        if myAnswer == threeValue[0] {
            if threeValue[enemyAnswer] == threeValue[1] {
                result = "You lose"
            } else if threeValue[enemyAnswer] == threeValue[2] {
                result = "You won"
            } else {
                result = "You have the same answer"
            }
        } else if myAnswer == threeValue[1] {
            if threeValue[enemyAnswer] == threeValue[2] {
                result = "You lose"
            } else if threeValue[enemyAnswer] == threeValue[0] {
                result = "You won"
            } else {
                result = "You have the same answer"
            }
        } else {
            if threeValue[enemyAnswer] == threeValue[0] {
                result = "You lose"
            } else if threeValue[enemyAnswer] == threeValue[1] {
                result = "You won"
            } else {
                result = "You have the same answer"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Choose answer", selection: $myAnswer) {
                        ForEach(threeValue, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Button("Play") {
                        enemyAnswer = Int.random(in: 0...2)
                        getResult()
                    }
                    Text(result)
                    Text("enemy Answer is \(threeValue[enemyAnswer])")
                }
            }
            .navigationTitle("Game")
        }
    }
}


#Preview {
    ContentView()
}
