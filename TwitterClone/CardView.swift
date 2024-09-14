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
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading){
                
                HStack{
                    Text(userName)
                        .lineLimit(1)
                    Image(systemName: "checkmark.seal.fill")
                    if let userId = userId {
                        Text("@\(userId)")
                            .lineLimit(1)
                    } else {
                        Text("@userId")                        .lineLimit(1)
                    }
                    Text("• 1d")                        .lineLimit(1)
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


#Preview {
    CardView(userName: "farhan haider kazmi", userId: "farhanadfarhan123")
}
