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

            Button(action: {}){
                Text("Continue with Google")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            }.padding(.top)
            Button(action: {}){
                HStack{
                    Image(systemName: "google_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20) // Set the icon size

                        .font(.headline)
                    Text("Continue with Apple")                    .font(.headline)
                }
                .padding()
                .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.gray, lineWidth: 2)
                    )
            }.padding(.top)
            
            Text("or")
            
            Button(action: {}){
                Text("Create account")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }.padding(.top)

            Text("By signing up, you agree to the Terms of Servie and Privacy Policy, including Cookie Use.")
                .font(.callout)
            Spacer()

            
            HStack {
                Text("Have an account already?")
                Text("Log in")
                    .foregroundColor(.blue)
            }
            .font(.none)

        }
        .padding(22)
    }
}

#Preview {
    ContentView()
}
