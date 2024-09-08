//
//  homeScreen.swift
//  TwitterClone
//
//  Created by farhan haider on 25/08/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var isDrawerOpen = false // State to manage drawer visibility
    @State private var showOptions = false


    let users = [
          (userName: "John Doe", userId: "john_doe123"),
          (userName: "Jane Smith", userId: "jane456"),
          (userName: "farhna haider", userId: "farhan123"),
          (userName: "arman khan", userId: "arman03"),
          (userName: "John don", userId: "don123"),
          (userName: "Jane mon", userId: "mon456"),
      ]
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
                        
                        LazyVStack(alignment: .center, spacing: 20) {
                            ForEach(users, id: \.userId) {user in
                                CardView(userName: user.userName, userId: user.userId)
                            }
                        }
                        
                    }
                }
                
                // Floating Button with Animation
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        if showOptions {
                            // Option Buttons
                            VStack {
                                Button(action: {
                                    // Action for Go Live
                                }) {
                                    HStack {
                                        Text("Go Live")
                                        Image(systemName: "video.fill")
                                    }
                                    .padding()
                                    .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    // Action for Spaces
                                }) {
                                    HStack {
                                        Text("Spaces")
                                        Image(systemName: "dot.radiowaves.left.and.right")
                                    }
                                    .padding()
                                    .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    // Action for Photos
                                }) {
                                    HStack {
                                        Text("Photos")
                                        Image(systemName: "photo.on.rectangle")
                                    }
                                    .padding()
                                    .cornerRadius(10)
                                }
                            }
                            .transition(.scale) // Animation transition for options
                            .padding(.bottom, 10)
                        }

                        Button(action: {
                            withAnimation {
                                showOptions.toggle() // Toggle the options menu
                            }
                        }) {
                            Image(systemName: showOptions ? "pencil" : "plus")
                                .font(.system(size: 24))
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }

                if isDrawerOpen {
                    DrawerView(isOpen: $isDrawerOpen)
                        .transition(.move(edge: .leading))
                        .zIndex(1)
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
            .navigationBarBackButtonHidden(true) // Hides the back button
        }
    }
}



struct DrawerView: View {
    @Binding var isOpen: Bool
    
    var following = 36
    var followers = 12

    var body: some View {
        VStack (alignment: .leading){
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
                    Image(systemName: "ellipsis.circle")
                        .padding(.bottom, 5)
                }
            }
            
            Text("User Name")
                .font(.headline)

            Text("@userid")
                .font(.subheadline)
                .padding(.bottom, 10)
            
            HStack {
                Text("\(following) Following")
                Text("\(followers) Followers")
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
        .padding(18)
        .frame(width: 250)
        .background(Color.gray)
        .offset(x: isOpen ? 0 : -250) // Slide in/out effect
    }
}


struct IconText: View {
    var body: some View {
        HStack{
            Image("")
            Text("")
        }
    }
}

#Preview {
    HomeScreenView()
}
