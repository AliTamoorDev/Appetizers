//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Ali Tamoor on 19/01/2024.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersUrl = baseURL + "appetizers"
    
    static let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getAppetizer(completion: @escaping (Result<AppetizerResponse, APError>) -> ()) {
        
        guard let url =  URL(string: appetizersUrl)  else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completion(.failure(.invalidResponse))
                return
            }
            
            if let data = data {
                do {
                    let appetizersData = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                    completion(.success(appetizersData))
                } catch {
                    completion(.failure(.invalidData))
                }
            }
        }
        task.resume()
    }

    
    func downloadImage(fromURLString urlString: String, completion: @escaping(UIImage?)->Void) {
        // If image is stored in cache
        if let image = NetworkManager.cache.object(forKey: NSString(string: urlString)) {
            completion(image)
            return
        }
        
        // To Download Image remotely
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            NetworkManager.cache.setObject(image, forKey: NSString(string: urlString))
            completion(image)
        }
        task.resume()
    }
}
