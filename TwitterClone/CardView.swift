//
//  CardView.swift
//  TwitterClone
//
//  Created by farhan haider on 02/09/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        HStack(){
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading){
                HStack{
                    Text("User Name")
                    Image(systemName: "checkmark.seal.fill")
                    Text("@userId • 1d")
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                    
                }
                Text("I'm deleting this soon because it's a legit cash-printing formula.")
                            .font(.body)
                Image("google_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
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
    }
}

struct IconView: View {
    var iconName: String
    var text: String?

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
            if let text = text {
                Text(text)
            }
        }
    }
}


#Preview {
    CardView()
}
