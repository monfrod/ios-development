//
//  ContentView.swift
//  swiftUIBOOK
//
//  Created by yunus on 04.12.2023.
//

import SwiftUI

struct ContentView: View {
    let apps: [App] = [
        App(name: "Стартап", features: ["Разработка простого мобильного приложения.", "Основной дизайн UI.", "Одна платформа (iOS или Android).", "Основная функциональность."], cost: "$5,000 - $15,000"),
        App(name: "Бизнес", features: ["Разработка средне-сложного мобильного приложения.", "Продвинутый дизайн UI.", "Поддержка обеих платформ.", "Интеграция с базовыми сервисами и API."], cost: "$20,000 - $50,000"),
        App(name: "Корпоратив", features: ["Разработка сложного и масштабируемого приложения.", "Премиальный дизайн UI.", "Поддержка всех платформ.", "Глубокая интеграция с внешними API."], cost: "$50,000 - $150,000 и выше")
    ]
    
    var body: some View {
        NavigationView {
            List(apps) { app in
                NavigationLink(destination: AppDetailView(app: app)) {
                    VStack(alignment: .leading) {
                        Text(app.name)
                            .font(.headline)
                        Text("Стоимость: \(app.cost)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Тарифы Аутсорса")
        }
    }
}
struct AppDetailView: View {
    let app: App
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(app.name)
                .font(.largeTitle)
            Text("Особенности:")
                .font(.headline)
            ForEach(app.features, id: \.self) { feature in
                Text("• \(feature)")
            }
        }
        .padding()
        .navigationTitle("Детали")
    }
}
struct App: Identifiable {
    var id = UUID()
    var name: String
    var features: [String]
    var cost: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
