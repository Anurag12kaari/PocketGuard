//
//  Tab.swift
//  Expense Tracker
//
//  Created by Anurag on 04/12/24.
//

import SwiftUI

enum Tab : String{
    case recent = "Recent"
    case search = "Filter"
    case chart = "Chart"
    case settings = "Settings"
    @ViewBuilder
    var tab: some View{
        switch self {
        case .recent:
            Image(systemName: "calendar")
            Text(self.rawValue)
        case .search:
            Image(systemName: "magnifyingglass")
            Text(self.rawValue)
        case .chart:
            Image(systemName: "chart.bar")
            Text(self.rawValue)
        case .settings:
            Image(systemName: "gearshape")
            Text(self.rawValue)
        }
        
    }

}
