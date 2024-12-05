//
//  SwiftUIView.swift
//  Expense Tracker
//
//  Created by Anurag on 04/12/24.
//

import SwiftUI

struct IntroScreen: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    var body: some View {
        VStack(spacing : 20){
            Text("Whats new in the \n Expense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top,65)
                .padding(.bottom,35)
        }
        VStack(alignment: .leading , spacing: 25,content: {
            PointView(symbol: "dollarsign", title: "Transcations", subtitle: "Keep track of your earning and expenses")
            PointView(symbol: "chart.bar.fill", title: "Visual Chart", subtitle: "View your transactions in a visual way")
            PointView(symbol: "magnifyingglass", title: "Advance Feature", subtitle: "Find expenses in advance search bar")
        })
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal,25)
        Spacer(minLength: 10)
        Button(action: {
            isFirstTime = false
        }, label: {
            Text("Continue")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth : .infinity)
                .padding(.vertical,14)
                .background(appInt.gradient,in : .rect(cornerRadius: 12))
                .contentShape(.rect)
                
            
        })
        .padding(15)
    }
}
@ViewBuilder
func PointView(symbol: String ,title: String,subtitle: String) -> some View {
    HStack(spacing : 20){
        Image(systemName: symbol)
            .font(.largeTitle)
            .foregroundStyle(appInt.gradient)
            .frame(width: 45)
        VStack(alignment: .leading,spacing: 6, content: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(subtitle)
                .foregroundStyle(.gray)
        })
            
        
    }
}

#Preview {
    IntroScreen()
}
