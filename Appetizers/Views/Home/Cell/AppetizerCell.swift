//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by Ali Tamoor on 12/01/2024.
//

import SwiftUI

struct AppetizerCell: View {
    
    var appetizer: AppetizerModel
    @State var image = Image(uiImage: UIImage(named: "food-placeholder")!)
    
    var body: some View {
        HStack {
            
            RemoteImage(url: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 75)
                .cornerRadius(8)
            
            
            VStack(alignment: .leading, spacing: 5, content: {
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                    .bold()
                Text("$\(String(format: "%.2f", appetizer.price))")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            })
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerCell(appetizer: MockData.sampleAppetizer)
}
