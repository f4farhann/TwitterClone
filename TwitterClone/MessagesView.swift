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
    let tweets: [Tweet] // You'll need to pass this from ContentView
    
    var body: some View {
        NavigationView {
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
                
                List {
                    Text("Messages content goes here")
                    Text("Messages content goes here")
                    Text("Messages content goes here")
                    Text("Messages content goes here")

                }
                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(true)
        }
    }
}
