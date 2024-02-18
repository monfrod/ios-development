//
//  ContentView.swift
//  WeSplit
//
//  Created by yunus on 01.02.2024.
//

import SwiftUI

struct RedTitle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red)
    }
}
extension View{
    func redtitle() -> some View{
        modifier(RedTitle())
    }
}

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberofPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let numberPeopleArrays = [2, 3, 4, 5, 6]
//    let tipPercentages = [10, 15, 20, 25 , 0]
    var totalPerson: Double {
        let peopleCount = Double(numberofPeople+2)
        let tipSelection = Double(tipPercentage)
        let totalCheck = checkAmount*(1+(tipSelection/100))
        print(peopleCount)
        print(tipSelection)
        print(totalCheck)
        return totalCheck/peopleCount
    }
    var totalCheck: Double {
        let tipSelection = Double(tipPercentage)
        let totalCheck = checkAmount*(1+(tipSelection/100))
        return totalCheck
    }
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberofPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much do you want to tip"){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0..<101, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Sum for people"){
                    Text(totalPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Total sum"){
                    Text("\(totalCheck)")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
