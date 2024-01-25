//
//  HomeView.swift
//  Appetizers
//
//  Created by Ali Tamoor on 11/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var appetizerVM = AppetizerViewModel()
    @State var isShowingDetail = false
    @State var selectedAppetizer = MockData.sampleAppetizer

    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List(appetizerVM.request, id: \.id) { appetizer in
                        //                        NavigationLink(value: appetizer) {
                        AppetizerCell(appetizer: appetizer)
                            .listRowSeparatorTint(.primaryBrand)
                            .onTapGesture {
                                isShowingDetail = true
                                selectedAppetizer = appetizer
                            }
                        //                        }
                    }
                    .listStyle(.plain)
                    .disabled(isShowingDetail)
                    .refreshable {
                        appetizerVM.fetchAppetizerList()
                    }
                }
                .navigationTitle("🍴Appetizers")
                .navigationDestination(for: AppetizerModel.self) { item in
                    //                AppetizerDetailView(appetizer: item)
                }
            }
            .blur(radius: isShowingDetail ? 40 : 0)
            
            .onViewDidLoad {
                appetizerVM.request = []
                appetizerVM.fetchAppetizerList()
            }
            
            .alert(appetizerVM.alertItem?.title ?? "", isPresented: $appetizerVM.isErrorOccured, presenting: appetizerVM.alertItem){ item in
                
            } message: {
                item in
                Text(item.message)
            }
            
            
            if isShowingDetail {
                AppetizerDetailView(isShowingDetail: $isShowingDetail, appetizer: selectedAppetizer)
            }
            
            if appetizerVM.isLoading {
                ProgressView {
                    Text("Loading")
                }
                .scaleEffect(1.5)
            }
        }
    }
}

#Preview {
    HomeView()
}
