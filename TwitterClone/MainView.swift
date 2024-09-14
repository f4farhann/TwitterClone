//
//  MainView.swift
//  TwitterClone
//
//  Created by farhan haider on 11/09/24.
//

import Foundation
import SwiftUI


struct Tweet: Identifiable {
    let id = UUID()
    let user: User
    let content: String
    let likes: Int
    let retweets: Int
    let replies: Int
    let time: String
}

struct User {
    let name: String
    let handle: String
    let avatar: String
}


struct MainView: View {
    @State private var showingDrawer = false
    
    let tweets = [
        Tweet(user: User(name: "John Doe", handle: "@johndoe", avatar: "person.circle"),
              content: "Just had an amazing day at the beach! 🏖️ #SummerVibes",
              likes: 42, retweets: 5, replies: 3, time: "2h"),
        Tweet(user: User(name: "Jane Smith", handle: "@janesmith", avatar: "person.circle.fill"),
              content: "Excited to announce my new book release! 📚 #NewBook #AuthorLife",
              likes: 128, retweets: 23, replies: 15, time: "5h"),
        Tweet(user: User(name: "Tech News", handle: "@technews", avatar: "newspaper.circle"),
              content: "Breaking: New AI breakthrough in natural language processing! #AI #Tech",
              likes: 356, retweets: 89, replies: 42, time: "1d")
    ]
    
    var body: some View {
        ZStack {
            TabView {
                HomeView(showingDrawer: $showingDrawer, tweets: tweets)
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView(showingDrawer: $showingDrawer, tweets: tweets)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                NotificationsView(showingDrawer: $showingDrawer, tweets: tweets)
                    .tabItem {
                        Image(systemName: "bell")
                    }
                
                MessagesView(showingDrawer: $showingDrawer, tweets: tweets)
                    .tabItem {
                        Image(systemName: "envelope")
                    }
            }
            
            if showingDrawer {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showingDrawer = false
                        }
                    }
            }
            
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    sideDrawerView(showingDrawer: $showingDrawer)
                        .frame(width: geometry.size.width * 0.75)
                        .offset(x: showingDrawer ? 0 : -geometry.size.width * 0.75)
                        .animation(.default, value: showingDrawer)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MainView()
}

