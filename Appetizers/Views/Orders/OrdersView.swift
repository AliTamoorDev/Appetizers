//
//  OrdersView.swift
//  Appetizers
//
//  Created by Ali Tamoor on 11/01/2024.
//

import SwiftUI

struct OrdersView: View {
    
    @EnvironmentObject var itemsInOrderList: OrderModel
//    @State var orderItems: [AppetizerModel] = MockData.sampleAppetizerRequest
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List() {
                        ForEach(itemsInOrderList.items) { item in
                            AppetizerCell(appetizer: item)
                        }
                        .onDelete(perform: removeOrderItem)
                    }
                    .listStyle(.plain)
                    
                    Button("$\(String(format: "%.2f", itemsInOrderList.totalPrice)) - Place Order") {
                        
                    }
                    .standardButtonStyle()
                    .padding(.bottom, 30)
                }
                
                if itemsInOrderList.items.isEmpty {
                    EmptyStateAppetizer(message: "Empty Order List. \n Add an appetizer to order.")
                }
            }
            .navigationTitle("🧾Orders")
        }
    }
    
    func removeOrderItem(indexSet: IndexSet) {
        itemsInOrderList.removeFromItems(at: indexSet)
    }
}

#Preview {
    OrdersView()
}
