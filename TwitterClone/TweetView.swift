//
//  TweetView.swift
//  TwitterClone
//
//  Created by farhan haider on 14/09/24.
//

import Foundation
import SwiftUI

struct TweetView: View {
    let tweet: Tweet
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            
            Image(systemName: tweet.user.avatar)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                
                HStack{
                    Text(tweet.user.name)
                            .font(.headline)
                            .lineLimit(1)

                        Text(tweet.user.handle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        Text("• \(tweet.time)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(1)

                    
                    Spacer()
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                }
                Text(tweet.content)
                    .font(.body)
                
                Image("google_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
           
                HStack{
                    IconView(iconName: "message", text: "2.4k")
                    Spacer()
                    IconView(iconName: "arrow.2.squarepath", text: "2.4k")
                    Spacer()
                    IconView(iconName: "heart", text: "2.4k")
                    Spacer()
                    IconView(iconName: "chart.bar", text: "2.4k")
                    Spacer()
                    IconView(iconName: "bookmark")
                    Spacer()
                    IconView(iconName: "arrowshape.turn.up.forward")
                    Spacer()
                }
            }
        }
        .padding(.vertical, 10)
    }
}



struct IconView: View {
    var iconName: String
    var text: String?

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .resizable()
                .lineLimit(1)
                .frame(width: 12, height: 12)
            if let text = text {
                Text(text)
                    .lineLimit(1)
                    .font(.system(size: 12))
            }
        }
    }
}

