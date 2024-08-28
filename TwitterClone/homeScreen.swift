//
//  homeScreen.swift
//  TwitterClone
//
//  Created by farhan haider on 25/08/24.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        ZStack{
            HStack{
                Image(systemName: "bird.fill")
                    .imageScale(.large)
                    .foregroundStyle(.blue)
                VStack{
                    Text("USER NAME")
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
