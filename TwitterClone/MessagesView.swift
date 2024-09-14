//
//  MessagesView.swift
//  TwitterClone
//
//  Created by farhan haider on 14/09/24.
//

import Foundation
import SwiftUI

struct MessagesView: View {
    
    @Binding var showingDrawer: Bool
    let tweets: [Tweet]
    @State private var showingNewTweetSheet = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(spacing: 0) {
                    TopAppBar(
                        title: "Messages",
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
                    SearchBar(text: $searchText)
                        .padding(.vertical)
                    
                    List {
                        ForEach(1...10, id: \.self) { _ in
                            MessageItem()
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


struct MessageItem: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("John Doe")
                        .font(.headline)
                    Text("@johndoe")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("2h")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Text("Hey, how's it going?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}
