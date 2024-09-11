//
//  MainView.swift
//  TwitterClone
//
//  Created by farhan haider on 11/09/24.
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeScreenView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            // Search Tab
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            // Trending Tab
            TrendingView()
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("Trending")
                }
           
           
            // Explore Tab
            ExploreView()
                .tabItem {
                    Image(systemName: "twoperson")
                }
            // Notification Tab
            NotificationView()
                .tabItem {
                    Image(systemName: "bell")
                }
            // Message Tab
            MessageView()
                .tabItem {
                    Image(systemName: "envelope")
                }
        }
    }
}

#Preview {
    MainView()
}

