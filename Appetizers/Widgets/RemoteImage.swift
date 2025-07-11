//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Ali Tamoor on 23/01/2024.
//

import SwiftUI

struct RemoteImage: View {
    var url: String
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        imageLoader.image
            .resizable()
            .onAppear {
                imageLoader.downloadImage(fromURLString: url)
            }
    }
}

#Preview {
    RemoteImage(url: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg")
}


// MARK: - ImageLoader Manager

// Using Async/Await
@MainActor
final class ImageLoader: ObservableObject {
    
    @Published var image = Image("food-placeholder")
    
    func downloadImage(fromURLString urlString: String) {
        Task {
            do {
                let uiImage = try await NetworkManager.shared.downloadImage(fromURLString: urlString)
                self.image = Image(uiImage: uiImage)
            } catch {
                print("Unable to load image")
            }
        }
    }
}

// Using Dispatch Queue

//final class ImageLoader: ObservableObject {
//    
//    @Published var image = Image("food-placeholder")
//    
//    func downloadImage(fromURLString urlString: String) {
//        NetworkManager.shared.downloadImage(fromURLString: urlString) { image in
//            if let img = image {
//                DispatchQueue.main.async {
//                    self.image = Image(uiImage: img)
//                }
//            }
//        }
//    }
//}
