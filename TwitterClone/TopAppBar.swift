//
//  TopAppBar.swift
//  TwitterClone
//
//  Created by farhan haider on 14/09/24.
//

import Foundation
import SwiftUI

struct TopAppBar: View {
    let title: String
    var leadingItem: (() -> AnyView)? = nil
    var trailingItem: (() -> AnyView)? = nil
    
    var body: some View {
        HStack {
            if let leadingItem = leadingItem {
                leadingItem()
            } else {
                Spacer()
            }
            
            Spacer()
            
            Text(title)
                .font(.headline)
            
            Spacer()
            
            if let trailingItem = trailingItem {
                trailingItem()
            } else {
                Spacer()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .overlay(
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Color(.systemGray4))
                .edgesIgnoringSafeArea(.horizontal)
                .offset(y: 16),
            alignment: .bottom
        )
    }
}
