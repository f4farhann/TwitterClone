//
//  ContentView.swift
//  TwitterClone
//
//  Created by farhan haider on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "bird.fill")
                .imageScale(.large)
                .foregroundStyle(.blue)
            Spacer()
            Text("See what's happening in the world right now.")
                .bold()
                .font(.largeTitle)
            Spacer()

//            Button("Create account")
            Text("By signing up, you agree to the Terms of Servie and Privacy Policy, including Cookie Use.")
            Spacer()

            Text("Have an account already?")
            Text("Log in")
        }
        .padding(22)
    }
}

#Preview {
    ContentView()
}
