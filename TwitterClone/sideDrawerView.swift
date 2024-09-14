//
//  sideDrawerView.swift
//  TwitterClone
//
//  Created by farhan haider on 14/09/24.
//

import Foundation
import SwiftUI

struct sideDrawerView: View {
    @Binding var showingDrawer: Bool
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("John Appleseed")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("@johnappleseed")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Text("iOS Developer | SwiftUI Enthusiast | Coffee Lover")
                        .font(.body)
                    
                    HStack {
                        Text("1,234 Following")
                        Text("5,678 Followers")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                .padding()
                
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Profile")) {
                        Label("Profile", systemImage: "person")
                    }
                    NavigationLink(destination: Text("Lists")) {
                        Label("Lists", systemImage: "list.bullet")
                    }
                    NavigationLink(destination: Text("Topics")) {
                        Label("Topics", systemImage: "text.bubble")
                    }
                    NavigationLink(destination: Text("Bookmarks")) {
                        Label("Bookmarks", systemImage: "bookmark")
                    }
                    NavigationLink(destination: Text("Moments")) {
                        Label("Moments", systemImage: "bolt")
                    }
                }
                
                Section(header: Text("Settings")) {
                    NavigationLink(destination: Text("Settings and privacy")) {
                        Label("Settings and privacy", systemImage: "gear")
                    }
                    NavigationLink(destination: Text("Help Center")) {
                        Label("Help Center", systemImage: "questionmark.circle")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Profile")
            .navigationBarItems(trailing: Button("Done") {
                withAnimation {
                    showingDrawer = false
                }
            })
        }
        .background(Color(.systemBackground))
    }
}

//#Preview {
//    sideDrawerView()
//}

