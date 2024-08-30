//
//  homeScreen.swift
//  TwitterClone
//
//  Created by farhan haider on 25/08/24.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Your content here
                Text("Hello, world!")
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Action button tapped")
                    }) {
                        Image(systemName: "plus") // Add an icon button
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Back button tapped")
                    }) {
                        Image(systemName: "arrow.backward")
                    }
                }
            }
        }
        
    }
}

#Preview {
    HomeScreenView()
}
