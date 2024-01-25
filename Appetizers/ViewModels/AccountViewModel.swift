//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Ali Tamoor on 24/01/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    @Published var user = UserModel()
    @Published var alertItem: AlertItem?
    @AppStorage("userData") var userData: Data?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty  else {
            alertItem = AlertContext.invalidDetails
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        if !isValidForm {
            user.isAlertShowing = true
            return
        }
        
        do {
            userData = try JSONEncoder().encode(user)
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.userSaveFailure
        }
        
        user.isAlertShowing = true
    }
    
    func retrieveInfo() {
        guard let userData else { return }
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {

        }
    }
}
