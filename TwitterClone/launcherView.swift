//
//  launcherView.swift
//  TwitterClone
//
//  Created by farhan haider on 14/09/24.
//

import Foundation
import SwiftUI

struct launcherView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "bird.fill")
                    .imageScale(.large)
                    .foregroundStyle(.blue)
                Spacer()
                Text("See what's happening in the world right now.")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                
                // Button continue with google
                Button(action: {}){
                    HStack{
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Google")
                            .font(.headline)
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
                
                // Button continue with apple
                Button(action: {}){
                    HStack{
                        Image("apple_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Continue with Apple")
                            .font(.headline)
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

                NavigationLink(destination: MainView()) {
                                    Text("Create account")
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(50)
                                }
                                .padding(.top)
                
                Text("By signing up, you agree to the Terms of Servie and Privacy Policy, including Cookie Use.")
                    .font(.callout)
                Spacer()
                
                
                HStack {
                    Text("Have an account already?")
                    
                    NavigationLink(destination: MainView()) {
                        Text("Log in")
                            .foregroundColor(.blue)
                    }
                }
                .font(.none)
            }
            .padding(22)
        }
    }
}

#Preview {
    launcherView()
}
