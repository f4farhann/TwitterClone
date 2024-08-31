//
//  homeScreen.swift
//  TwitterClone
//
//  Created by farhan haider on 25/08/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var isDrawerOpen = false // State to manage drawer visibility

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        // Top section with "For you" and "Following"
                        HStack {
                            Spacer()
                            Text("For you")
                                .font(.headline)
                            Spacer()
                            Text("Following")
                                .font(.headline)
                            Spacer()
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
                if isDrawerOpen {
                    DrawerView(isOpen: $isDrawerOpen)
                        .transition(.move(edge: .leading))
                        .zIndex(1) // Ensure the drawer is on top
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
                    }
                }
            }
        }
    }
}



struct DrawerView: View {
    @Binding var isOpen: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        isOpen = false
                    }
                }) {
                    Image(systemName: "person.crop.circle")
                }
                Spacer()
                Button(action: {
                    print("Options button tapped in drawer")
                }) {
                    Image(systemName: "ellipsis")
                }
            }
            .padding()
            
            Text("User Name")
                .font(.headline)
                .padding(.top, 10)
            Text("User ID")
                .font(.subheadline)
                .padding(.bottom, 10)

            HStack {
                Text("Following")
                Spacer()
                Text("Followers")
            }
            .padding(.bottom, 10)

            Divider()

            VStack(alignment: .leading, spacing: 10) {
                Button("Profile") { }
                Button("Premium") { }
                Button("Bookmarks") { }
                Button("Lists") { }
                Button("Spaces") { }
                Button("Monetization") { }
                Divider()
                Button("Settings") { }
                Button("Support") { }
            }
            .padding(.vertical, 10)
            
            Spacer()
        }
        .frame(width: 250)
        .background(Color.white)
        .offset(x: isOpen ? 0 : -250) // Slide in/out effect
    }
}

#Preview {
    HomeScreenView()
}
