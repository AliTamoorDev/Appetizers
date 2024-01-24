//
//  AccountView.swift
//  Appetizers
//
//  Created by Ali Tamoor on 11/01/2024.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountVM = AccountViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Personal Info") {
                        TextField("First Name", text: $accountVM.user.firstName)
                        TextField("Last Name", text: $accountVM.user.lastName)
                        TextField("Email", text: $accountVM.user.email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        
                        DatePicker("Birthday", selection: $accountVM.user.date, displayedComponents: .date)
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
