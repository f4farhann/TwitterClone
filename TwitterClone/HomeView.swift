//
//  HomeView.swift
//  TwitterClone
//
//  Created by farhan haider on 14/09/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @Binding var showingDrawer: Bool
    let tweets: [Tweet]
    @State private var showingNewTweetSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    TopAppBar(
                        title: "",
                        leadingItem: {
                            AnyView(
                                Button(action: {
                                    withAnimation {
                                        showingDrawer.toggle()
                                    }
                                }) {
                                    Image(systemName: "person.crop.circle")
                                        .imageScale(.large)
                                }
                            )
                        },
                        trailingItem: {
                            AnyView(
                                Image(systemName: "sparkles")
                                    .imageScale(.large)
                            )
                        }
                    )
                    //
                    List {
                        ForEach(tweets) { tweet in
                            TweetView(tweet: tweet)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingActionButton {
                            showingNewTweetSheet = true
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingNewTweetSheet) {
            NewTweetView(isPresented: $showingNewTweetSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var showingDrawer = false
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
        HomeView(showingDrawer: $showingDrawer, tweets: tweets)
    }
}



struct FloatingActionButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(radius: 4, x: 0, y: 4)
        }
    }
}

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State private var tweetText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $tweetText)
                    .padding()
                    .frame(height: 200)
            }
            .navigationBarTitle("New Tweet", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Tweet") {
                    // Here you would typically send the tweet
                    print("Tweet: \(tweetText)")
                    isPresented = false
                }
                    .disabled(tweetText.isEmpty)
            )
        }
    }
}
