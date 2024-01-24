//
//  EmptyStateAppetizer.swift
//  Appetizers
//
//  Created by Ali Tamoor on 24/01/2024.
//

import SwiftUI

struct EmptyStateAppetizer: View {
    
    var imageName: String
    var message: String
    
    init(imageName: String = "empty-order", message: String = "Default Message") {
        self.imageName = imageName
        self.message = message
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
        
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                
                Text(message)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyStateAppetizer()
}
