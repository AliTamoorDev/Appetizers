//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Ali Tamoor on 22/01/2024.
//

import SwiftUI

final class AppetizerViewModel: ObservableObject {

    
    @Published var request: [AppetizerModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isErrorOccured = false
    @Published var isCellTapped = false

    // MARK: - Methods
    func fetchAppetizerList() {
        isLoading = true
        NetworkManager.shared.getAppetizer { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let appetizerModels):
                    print("Results: \(appetizerModels)")
                    self.request = appetizerModels.request
                case .failure(let error):
                    print("Error fetching appetizers: \(error)")
                    self.request = []
                    isErrorOccured = true
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                isLoading = false
            }
        }
    }
}
