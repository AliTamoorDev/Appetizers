//
//  AppetizerModel.swift
//  Appetizers
//
//  Created by Ali Tamoor on 12/01/2024.
//

import Foundation
import SwiftUI

struct AppetizerModel: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let protein: Int
    let carbs: Int
    let calories: Int
}

struct AppetizerResponse: Decodable {
    let request: [AppetizerModel]
}

// MockData
struct MockData {
    static let sampleAppetizer = AppetizerModel(id: 999, name: "Test Appetizer", description: "This is description for my appetizer. It's yummy", price: 9.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/stuff-shells.jpg", protein: 40, carbs: 20, calories: 100)
    static let sampleAppetizerRequest = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
