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
                        TextField("First Name", text: $accountVM.firstName)
                        TextField("Last Name", text: $accountVM.lastName)
                        TextField("Email", text: $accountVM.email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        
                        DatePicker("Birthday", selection: $accountVM.date, displayedComponents: .date)
                            .tint(.primaryBrand)
                        Button(action: {
                            accountVM.saveChanges()
                        }, label: {
                            Text("Save")
                        })
                    }
                    
                    Section("Requests") {
                        Toggle("Extra Napkins", isOn: $accountVM.extraNapkins)
                        Toggle("Frequent Refills", isOn: $accountVM.frequestRefills)
                    }
                }
                .navigationTitle("Account")
            }
        }
        .alert("Invalid Details", isPresented: $accountVM.isAlertShowing, presenting: accountVM.alertItem) { item in
            
        } message: { item in
            Text(item.message)
        }
    }
}

#Preview {
    AccountView()
}
