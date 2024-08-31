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
                HStack{
                    Text("For you")
                    Text("Following")
                }
                Spacer()

                // Your content here
                Text("app content")
                    .padding()
                Spacer()

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
