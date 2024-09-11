//
//  MessageView.swift
//  TwitterClone
//
//  Created by farhan haider on 11/09/24.
//

import Foundation
import SwiftUI

struct MessageView: View {
    @State private var isDrawerOpen = false // State to manage drawer visibility
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack (alignment: .center) {
                        Text("Message Screen")
                    }
                }
            }
            .toolbar {
                // Profile icon
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            isDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
                // App icon
                ToolbarItem(placement: .principal) {
                    Button(action: {
                        print("App icon")
                    }) {
                        Image(systemName: "bird.fill")
                    }
                }
                // Option selector
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Options button tapped")
                    }) {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                    }
                }
            }
            //            .navigationBarBackButtonHidden(true) // Hides the back button

        }
    }
}

#Preview {
    MessageView()
}
