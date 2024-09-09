//
//  homeScreen.swift
//  TwitterClone
//
//  Created by farhan haider on 25/08/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var isDrawerOpen = false // State to manage drawer visibility
    @State private var isFABClicked = false // State to manage FAB icon change


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
                .blur(radius: isFABClicked ? 5 : 0) // Apply blur when FAB is clicked
                
                if isDrawerOpen {
                    DrawerView(isOpen: $isDrawerOpen)
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                }
             
                
                // Floating action button and options
                VStack {
                    Spacer()
                    // Additional options that appear when FAB is clicked
                    if isFABClicked {
                        HStack{
                            Spacer()
                            VStack(spacing: 10) {
                                FABOptionButton(label: "Go Live", systemIcon:"video.fill")
                                FABOptionButton(label: "Space", systemIcon: "mic.fill")
                                FABOptionButton(label: "Photos", systemIcon: "photo.fill")
                            }
                        }
                   }

                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                isFABClicked.toggle() // Toggle the state on button click
                            }
                        }) {
                            Image(systemName: isFABClicked ? "pencil" : "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .padding()
                                .rotationEffect(.degrees(isFABClicked ? 360 : 0)) // Rotate the icon
                        }
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .padding()
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
            .navigationBarBackButtonHidden(true) // Hides the back button
        }
    }
}

// A separate view for each FAB option
struct FABOptionButton: View {
    let label: String
    let systemIcon: String
    
    var body: some View {
        Button(action: {
            print("\(label) button tapped")
        }) {
            HStack {
                Text(label)
                    .foregroundColor(.blue)
                    .font(.body)
                Image(systemName: systemIcon)
                    .resizable() // Make icon resizable
                    .scaledToFit()
                    .frame(width: 16, height: 16) // Smaller size for option icons
                    .foregroundColor(.blue)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                }
            .cornerRadius(8)
            .shadow(radius: 5)
        }
        .transition(.move(edge: .trailing))
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
