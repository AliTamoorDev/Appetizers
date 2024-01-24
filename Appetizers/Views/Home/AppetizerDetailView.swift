//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Ali Tamoor on 23/01/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @State var isItemAddedToOrderList = false
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var itemsInOrderList: OrderModel

    var appetizer: AppetizerModel
    
    var body: some View {
        VStack {
            RemoteImage(url: appetizer.imageURL)
                .frame(height: 225)
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                
                HStack(spacing: 30) {
                    NutritionInfoView(title: "Calories", info: appetizer.calories)
                    NutritionInfoView(title: "Carbs", info: appetizer.carbs)
                    NutritionInfoView(title: "Proteins", info: appetizer.protein)
                }
                .padding()
                
                Spacer()
                Button("$\(String(format: "%0.2f", appetizer.price)) -  Add to Order") {
                    itemsInOrderList.addToItems(appetizer)
                    isItemAddedToOrderList = true
                }
                .buttonStyle(.borderedProminent)
                .bold()
                .tint(Color.primaryBrand)
                .padding(.bottom, 30)
            }
        }
        .overlay(alignment: .topTrailing) {
            Button(action: {
                isShowingDetail = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(5)
                    .foregroundStyle(.gray)
            })
        }
        .frame(height: 525)
        .background(content: {
            Color(.systemBackground)
        })
        .cornerRadius(12)
        .padding(.horizontal, 20)
        .shadow(radius: 40)
        
        .alert(isPresented: $isItemAddedToOrderList, content: {
            Alert(title: Text(AlertContext.itemAddedInOrder.title), message: Text(AlertContext.itemAddedInOrder.message), dismissButton: .default(Text("OK")) {
                isShowingDetail = false
            })
        })
    }
}

#Preview {
    AppetizerDetailView(isShowingDetail: .constant(false), appetizer: MockData.sampleAppetizer)
}

struct NutritionInfoView: View {
    var title: String
    var info: Double
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
            Text(String(format: "%0.0f", info))
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
