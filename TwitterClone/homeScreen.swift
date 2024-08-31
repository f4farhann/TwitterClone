//
//  homeScreen.swift
//  TwitterClone
//
//  Created by farhan haider on 25/08/24.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    
    // make the full screen scrolable
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading){
                    // make this at the top of the screen
                    HStack(alignment: .center){
                        Text("For you")
                            .font(.headline)
                        Text("Following")
                            .font(.headline)
                    }
                    
                    // List view using LazyVStack
                    LazyVStack(alignment: .center, spacing: 20) {
                        ForEach(1..<20) { item in
                            Divider()
                            Text("Item \(item)")
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
                }
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Button(action: {
                            print("App icon")
                        }) {
                            Image(systemName: "bird.fill")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("Navigate to Profile")
                        }) {
                            Image(systemName: "person.crop.circle")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Navigate to Profile")
                        }) {
                            Image(systemName: "ellipsis")
                        }
                    }
                    
                }
            }
        }
}

#Preview {
    HomeScreenView()
}
