//
//  ContentView.swift
//  100dayChallenge1
//
//  Created by yunus on 02.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var distance = "Метры"
    @State private var ddistance = "Мили"
    @State private var distance1 = 0.0
    var distance2: Double {
        switch distance{
        case "Метры": 
            switch ddistance{
            case "Километры": return distance1/1000
            case "Сантиметры": return distance1/100
            case "Мили": return distance1*0.000621371
            default: return distance1
            }
        case "Сантиметры":
            switch ddistance{
            case "Километры": return distance1/100000
            case "Метры": return distance1/100
            case "Мили": return distance1*0.00000621371
            default: return distance1
            }
        case "Километры":
            switch ddistance{
            case "Сантиметры": return distance1*100000
            case "Метры": return distance1*100
            case "Мили": return distance1*0.621371
            default: return distance1
            }
        default:
            switch ddistance{
            case "Сантиметры": return distance1*160933.999997549
            case "Метры": return distance1*1609.34
            case "Километры": return distance1*1.60934
            default: return distance1
            }
        }
    }
    
    
    let distanceValue = ["Метры", "Сантиметры", "Километры", "Мили"]
    var body: some View {
        NavigationStack{
            Form{
                Section("Дистанция"){
                    Picker("Выберите единицу измерение", selection: $distance){
                        ForEach(distanceValue, id: \.self){
                            Text($0)
                        }
                     }
                    .pickerStyle(.segmented)
                    TextField("Введите число", value:$distance1, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Выберите единицу измерение", selection: $ddistance){
                        ForEach(distanceValue, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(distance2)")
                }
            }
            .navigationTitle("Конвертер")
        }
    }
}

#Preview {
    ContentView()
}
