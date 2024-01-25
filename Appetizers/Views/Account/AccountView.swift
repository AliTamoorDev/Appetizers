//
//  AccountView.swift
//  Appetizers
//
//  Created by Ali Tamoor on 11/01/2024.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountVM = AccountViewModel()
    @FocusState var currentFocusedField: inputFields?
    
    enum inputFields {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Personal Info") {
                        TextField("First Name", text: $accountVM.user.firstName)
                            .focused($currentFocusedField, equals: .firstName)
                            .onSubmit { currentFocusedField = .lastName }
                            .submitLabel(.next)
                        
                        TextField("Last Name", text: $accountVM.user.lastName)
                            .focused($currentFocusedField, equals: .lastName)
                            .onSubmit { currentFocusedField = .email }
                            .submitLabel(.next)

                        TextField("Email", text: $accountVM.user.email)
                            .focused($currentFocusedField, equals: .email)
                            .onSubmit { currentFocusedField = nil }
                            .submitLabel(.continue)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        
                        DatePicker("Birthday", selection: $accountVM.user.date,in: Date().oneHundredYearAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                            .tint(.primaryBrand)
                        Button(action: {
                            accountVM.saveChanges()
                        }, label: {
                            Text("Save")
                        })
                    }
                    
                    Section("Requests") {
                        Toggle("Extra Napkins", isOn: $accountVM.user.extraNapkins)
                        Toggle("Frequent Refills", isOn: $accountVM.user.frequestRefills)
                    }
                }
                .navigationTitle("Account")
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button("Dismiss") {
                            currentFocusedField = nil 
                        }
                    }
                }
            }
            .onAppear {
                accountVM.retrieveInfo()
            }
        }
        .alert(accountVM.alertItem?.title ?? "", isPresented: $accountVM.user.isAlertShowing, presenting: accountVM.alertItem) { item in
            
        } message: { item in
            Text(item.message)
        }
    }
}

#Preview {
    AccountView()
}
