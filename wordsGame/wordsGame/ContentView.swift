//
//  ContentView.swift
//  wordsGame
//
//  Created by yunus on 05.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Привет, мир!")
                .font(.title)
                .foregroundColor(.blue)
            
            Spacer()
            
            Button(action: {
                // Действие, которое происходит при нажатии на кнопку
                print("Кнопка нажата!")
            }) {
                Text("Нажми меня")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// jfnakrnglajkrsnlrlalsr
//arganrlknglksrgraenglsrelgnsnrejgslrgajrkngjkarnfrang
//argaorg
