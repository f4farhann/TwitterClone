//
//  NotificationsView.swift
//  TwitterClone
//
//  Created by farhan haider on 14/09/24.
//

import Foundation
import SwiftUI

struct NotificationsView: View {
    @Binding var showingDrawer: Bool
    let tweets: [Tweet] // You'll need to pass this from ContentView
    @State private var showingNewTweetSheet = false
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(spacing: 0) {
                    TopAppBar(
                        title: "Notifications",
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
                    
                    List {
                        ForEach(1...10, id: \.self) { _ in
                            NotificationItem()
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

struct NotificationItem: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "person.2")
                .foregroundColor(.blue)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(.gray)
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(.gray)
                }
                
                Text("John Doe and Jane Smith liked your Tweet")
                    .font(.subheadline)
                
                Text("Your original tweet content goes here...")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}
