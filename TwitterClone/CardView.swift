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
                Text("NAME")
                Text("CONTENT TEXT")
                Image("google_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                HStack{
                    Image(systemName: "message")
                      Image(systemName: "arrow.2.squarepath")
                      Image(systemName: "heart")
                      Image(systemName: "chart.bar")
                      Image(systemName: "bookmark")
                      Image(systemName: "share")
                }
                
                
            }
        }
    }
}

#Preview {
    CardView()
}
