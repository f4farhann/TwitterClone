//
//  SearchView.swift
//  TwitterClone
//
//  Created by farhan haider on 11/09/24.
//

import Foundation
import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            // 1
            ZStack(alignment: .bottomTrailing) {
                
            }
        }
    }
}

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

struct farhanView: View {
    let tweets = [
        Tweet(user: User(name: "farhan haider kazmi", handle: "@farhanhaiderkazmi", avatar: "person.circle"),
              content: "Just had an amazing day at the beach! 🏖️ #SummerVibes",
              likes: 42, retweets: 5, replies: 3, time: "2h"),
        Tweet(user: User(name: "Jane Smith", handle: "@janesmith", avatar: "person.circle.fill"),
              content: "Excited to announce my new book release! 📚 #NewBook #AuthorLife",
              likes: 128, retweets: 23, replies: 15, time: "5h"),
        Tweet(user: User(name: "Jane Smith", handle: "@janesmith", avatar: "person.circle.fill"),
              content: "Excited to announce my new book release! 📚 #NewBook #AuthorLife",
              likes: 128, retweets: 23, replies: 15, time: "5h"),
        Tweet(user: User(name: "Jane Smith", handle: "@janesmith", avatar: "person.circle.fill"),
              content: "Excited to announce my new book release! 📚 #NewBook #AuthorLife",
              likes: 128, retweets: 23, replies: 15, time: "5h"),
        Tweet(user: User(name: "Jane Smith", handle: "@janesmith", avatar: "person.circle.fill"),
              content: "Excited to announce my new book release! 📚 #NewBook #AuthorLife",
              likes: 128, retweets: 23, replies: 15, time: "5h"),
        Tweet(user: User(name: "Tech News", handle: "@technews", avatar: "newspaper.circle"),
              content: "Breaking: New AI breakthrough in natural language processing! #AI #Tech",
              likes: 356, retweets: 89, replies: 42, time: "1d")
        
    ]
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(tweets) { tweet in
                        TweetView(tweet: tweet)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large),
                    trailing:
                    Image(systemName: "sparkles")
                        .imageScale(.large)
                )
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "bell")
                    Text("Notifications")
                }
            
            Text("Messages")
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Messages")
                }
        }
    }
}

struct TweetView: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: tweet.user.avatar)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(tweet.user.name)
                        .font(.headline)
                    Text(tweet.user.handle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text(tweet.time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Text(tweet.content)
                .font(.body)
            
            HStack(spacing: 40) {
                HStack {
                    Image(systemName: "bubble.left")
                    Text("\(tweet.replies)")
                }
                HStack {
                    Image(systemName: "arrow.2.squarepath")
                    Text("\(tweet.retweets)")
                }
                HStack {
                    Image(systemName: "heart")
                    Text("\(tweet.likes)")
                }
                Image(systemName: "square.and.arrow.up")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}

struct farhanView_Previews: PreviewProvider {
    static var previews: some View {
        farhanView()
    }
}
