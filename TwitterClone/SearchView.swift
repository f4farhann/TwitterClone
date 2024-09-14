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
