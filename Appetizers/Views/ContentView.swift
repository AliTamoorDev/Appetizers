//
//  ContentView.swift
//  Appetizers
//
//  Created by Ali Tamoor on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var itemsInOrderList = OrderModel()
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .navigationTitle("freis")
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house")
                    }
                
                OrdersView()
                    .tabItem {
                        Text("Orders")
                        Image(systemName: "book.pages")
                    }
                
                AccountView()
                    .tabItem {
                        Text("Account")
                        Image(systemName: "person")
                    }
            }
            .tint(Color.primaryBrand)
            .environmentObject(itemsInOrderList)
        }
    }
}

#Preview {
    ContentView()
}
