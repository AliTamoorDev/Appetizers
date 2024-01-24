//
//  OrderModel.swift
//  Appetizers
//
//  Created by Ali Tamoor on 24/01/2024.
//

import Foundation

final class OrderModel: ObservableObject {
    
    @Published var items: [AppetizerModel] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func addToItems(_ item: AppetizerModel) {
        items.append(item)
    }
    
    func removeFromItems(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
