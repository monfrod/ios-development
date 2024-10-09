//
//  ContentView.swift
//  weatherAppSUI
//
//  Created by yunus on 30.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .gray : .white,
                           bottomColor: isNight ? .black : .blue)
            VStack{
                CityName(city: "Almaty", country: "KZ")
                VStack{
                    ImageView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    TemperatureText(temperature: 31)
                }
                .padding(.bottom, 60)
                HStack{
                    WeatherDay(dayOfWeek: "Tue",
                               iconWeather: "cloud.sun.fill",
                               temperature: 26)
                    WeatherDay(dayOfWeek: "Wed",
                               iconWeather: "sun.max.fill",
                               temperature: 29)
                    WeatherDay(dayOfWeek: "Thu",
                               iconWeather: "sun.rain.fill",
                               temperature: 21)
                    WeatherDay(dayOfWeek: "Fri",
                               iconWeather: "sun.horizon.fill",
                               temperature: 27)
                }
                Spacer()
                Button(action: {
                    isNight.toggle()
                }, label: {
                    Text("Change Data time")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                })
                .foregroundStyle(.black)
                .font(.system(size: 25))
                Spacer()
            }
            
        }
    }
}
struct WeatherDay: View {
    var dayOfWeek: String
    var iconWeather: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text("\(dayOfWeek)")
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .padding(.bottom, 5)
            Image(systemName: "\(iconWeather)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
}

#Preview {
    ContentView()
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .bottomTrailing,
                       endPoint: .topLeading)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityName: View {
    var city: String
    var country: String
    
    var body: some View {
        Text("\(city), \(country)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding(.bottom, 20)
    }
}

struct ImageView: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 160 )
    }
}

struct TemperatureText: View {
    
    var temperature: Int
    
    var body: some View {
        Text("\(temperature)°")
            .foregroundStyle(.white)
            .font(.system(size: 90, weight: .bold))
    }
}

