//
//  ContentView.swift
//  SwiftAppSwiftUI
//
//  Created by yunus on 08.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 150)
                
                NavigationLink(destination: FirstPage()) {
                    Text("Біздің бағаларды қараңыз    ")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                NavigationLink(destination: SecondPage()) {
                    Text("Біздің миссиямыз                 ")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .background(Color.orange)
            .navigationTitle("SwiftApp")
        }
    }
}

    struct FirstPage: View {
        var body: some View {
            VStack{
                Text("Стандартты тарифы").font(.largeTitle.bold())
                Text("$6,990").bold()
                Text("✅Қарапайым мобильді қосымшаны әзірлеу ✅Экрандардың шектеулі саны бар негізгі функционалдылық")
                    .padding(.bottom,20)
                Text("Кәсіби тарифы").font(.largeTitle.bold())
                Text("$13,990").bold()
                Text("✅Жетілдірілген пайдаланушы интерфейсінің дизайны")
                Text("✅Қауіпсіздік пен деректерді қорғаудың жақсы деңгейі")
                Text("✅Бірнеше экрандармен және қосымша мүмкіндіктермен әзірлеу")
                    .padding(.bottom, 20)
                Text("Әккі тарифы").font(.largeTitle.bold())
                Text("$19,990").bold()
                Text("✅Күрделі және ауқымды мобильді қосымшаны әзірлеу")
                Text("✅Экрандары көп, күрделі функциялары және бейімделгіштігі бар қосымшаны әзірлеу")
                Text("✅Бір жыл бойы қолданбаларды қолдау")
                Spacer()
                    .navigationTitle("Қызметтердің бағалары  ")
            }
        }
    }

    struct SecondPage: View {
        var body: some View {
            Text("Біздің назарымыз бен құмарлығымыз шабыттандыратын, түрлендіретін және жаңаратын технологиялық шешімдерді жасау болып табылады. Біздің миссиямыз тек қолданбаларды әзірлеу емес, айналамыздағы әлемді өзгертетін цифрлық тәжірибені жасау").font(.system(size: 20)).bold()
                .padding(.bottom, 20)
            Text("Біздің құндылықтарымыз:").font(.system(size: 25)).bold()
            Text("1) Шығармашылық және инновация: бірегей және тиімді шешімдерді жасау үшін креативті ойлау және инновациялық тәсілдер арқылы мәселелерді шешеміз.").bold()
            Text("2) Серіктестік және сенім: Біз клиенттерімізбен және серіктестерімізбен ұзақ мерзімді қарым-қатынас орнату арқылы серіктестік пен сенімді бағалаймыз.").bold()
            Spacer()
            Image("001")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 350)
                .navigationTitle("Біздің миссиямыз")
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
