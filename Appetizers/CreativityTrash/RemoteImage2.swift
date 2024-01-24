////// KACHRA
///
///
////  RemoteImage.swift
////  Appetizers
////
////  Created by Ali Tamoor on 23/01/2024.
////
//
//import SwiftUI
//
//struct RemoteImage: View {
//    
//    @State var appetizerImage: Image = Image("food-placeholder") {
//        didSet {
//            NetworkManager.cache.setObject(appetizerImage.asUIImage(), forKey: NSString(string: imageURL))
//        }
//    }
//    
//    @State var app = AsyncImage(url: URL(string: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-wings.jpg")) { image in
//        image
//            .resizable()
//    } placeholder: {
//        Image("food-placeholder")
//    }
//    
//    let imageURL: String
//    
//    var body: some View {
//        ZStack {  // Use ZStack to overlay loading indicator
//            appetizerImage
//                .resizable()
//                .onAppear {
//                    if let uiImage = NetworkManager.cache.object(forKey: NSString(string: imageURL)) {
//                        appetizerImage = Image(uiImage: uiImage)
//                    } else {
//                        app = AsyncImage(url: URL(string: imageURL)) { img in
//                            appetizerImage = img
//                            return img.resizable()
//                        } placeholder: {
//                            Image("food-placeholder").resizable()
//                        }
//                    }
//                }
//        }
//    }
//}
//
//
////#Preview {
////    RemoteImage()
////}
//
//
//extension View {
//// This function changes our View to UIView, then calls another function
//// to convert the newly-made UIView to a UIImage.
//    public func asUIImage() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//        
// // Set the background to be transparent incase the image is a PNG, WebP or (Static) GIF
//        controller.view.backgroundColor = .clear
//        
//        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
//        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
//        
//        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
//        controller.view.bounds = CGRect(origin: .zero, size: size)
//        controller.view.sizeToFit()
//        
//// here is the call to the function that converts UIView to UIImage: `.asUIImage()`
//        let image = controller.view.asUIImage()
//        controller.view.removeFromSuperview()
//        return image
//    }
//}
//
//extension UIView {
//// This is the function to convert UIView to UIImage
//    public func asUIImage() -> UIImage {
//        let renderer = UIGraphicsImageRenderer(bounds: bounds)
//        return renderer.image { rendererContext in
//            layer.render(in: rendererContext.cgContext)
//        }
//    }
//}
