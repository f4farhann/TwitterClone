//
//  SearchView.swift
//  TwitterClone
//
//  Created by farhan haider on 11/09/24.
//

import Foundation
import SwiftUI

struct SearchView: View {
    
    @Binding var showingDrawer: Bool
    let tweets: [Tweet]
    @State private var showingNewTweetSheet = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(spacing: 0) {
                    TopAppBar(
                        title: "Search",
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
                                Image(systemName: "gearshape.fill")
                                    .imageScale(.large)
                            )
                        }
                    )
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            SearchBar(text: $searchText)
                            
                            ForEach(["For you", "Trending", "News", "Sports", "Entertainment"], id: \.self) { category in
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(category)
                                        .font(.headline)
                                        .padding(.horizontal)
                                        .padding(.top, 10)
                                    
                                    ForEach(1...3, id: \.self) { _ in
                                        TrendingItem()
                                    }
                                }
                            }
                        }
                    }
                    
                    List {
                        Text("Search content goes here")
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

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search Twitter", text: $text)
                .foregroundColor(.primary)
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct TrendingItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Trending in Technology")
                .font(.caption)
                .foregroundColor(.gray)
            Text("#SwiftUI")
                .font(.headline)
            Text("97.5K Tweets")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}
