//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Ali Tamoor on 24/01/2024.
//

import Foundation

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var date = Date()

    @Published var extraNapkins = false
    @Published var frequestRefills = false
    @Published var isAlertShowing = false

    @Published var alertItem: AlertItem?

    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty  else {
            alertItem = AlertContext.invalidDetails
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        isAlertShowing = !isValidForm
    }
}
