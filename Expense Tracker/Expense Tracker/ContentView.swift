//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Anurag on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @State private var activeTab: Tab = .recent
    
    var body: some View {
        VStack {
            TabView(selection: $activeTab){
                Recents()
                    .tag(Tab.recent)
                    .tabItem { Tab.recent.tab}
                Search()
                    .tag(Tab.recent)
                    .tabItem { Tab.search.tab}
                Graphs()
                    .tag(Tab.recent)
                    .tabItem { Tab.chart.tab}
               Settings()
                    .tag(Tab.recent)
                    .tabItem { Tab.settings.tab}
            }
            .sheet(isPresented: $isFirstTime, content: {
                IntroScreen()
                    .invalidatableContent()
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
