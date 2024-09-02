//
//  CardView.swift
//  TwitterClone
//
//  Created by farhan haider on 02/09/24.
//

import SwiftUI

struct CardView: View {
    
    var userName: String
    var userId: String?
    
    var body: some View {
        HStack(alignment: .top){
            
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading){
                
                HStack{
                    Text(userName)
                    Image(systemName: "checkmark.seal.fill")
                    if let userId = userId {
                        Text("@\(userId) • 1d")
                    } else {
                        Text("@userId • 1d")
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                }
                
                Text("I'm deleting this soon because it's a legit cash-printing formula.")
                            .font(.body)
                
                Image("google_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                   
                
                HStack{
                    IconView(iconName: "message", text: "2.4k")
                       IconView(iconName: "arrow.2.squarepath", text: "2.4k")
                       IconView(iconName: "heart", text: "2.4k")
                       IconView(iconName: "chart.bar", text: "2.4k")
                       IconView(iconName: "bookmark")
                       IconView(iconName: "arrowshape.turn.up.forward")
                }
                
            }
        }
        .padding(10)
    }
}

struct IconView: View {
    var iconName: String
    var text: String?

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .resizable()
                  .frame(width: 16, height: 16)
            if let text = text {
                Text(text)
            }
        }
    }
}


#Preview {
    CardView(userName: "farhan haider", userId: "farhan123")
}
