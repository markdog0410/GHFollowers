//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/2/27.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    let decoder = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    //    教育示範用：
    //    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
    //        let endPoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
    //
    //        guard let url = URL(string: endPoint) else {
    //            completed(.failure(.invalidUsername))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                decoder.keyDecodingStrategy = .convertFromSnakeCase
    //                let followers = try decoder.decode([Follower].self, from: data)
    //                completed(.success(followers))
    //            } catch {
    ////                completed(nil, error.localizedDescription)
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //        task.resume()
    //    }
    
//  async方法重構ＡＰＩ：
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endPoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            throw GFError.invalidUsername
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        
        do {
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw GFError.invalidData
        }
    }
    
//  async方法重構ＡＰＩ：
    func getUserInfo(for username: String) async throws -> User {
        let endPoint = baseUrl + "\(username)"
        
        guard let url = URL(string: endPoint) else {
            throw GFError.invalidUsername
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        
        do {
            let user = try decoder.decode(User.self, from: data)
            return user
        } catch {
            throw GFError.invalidData
        }
    }

//  async API重構：
    func downloadImage(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            return image
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else {
                return nil
            }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
//    教育示範用：
//    func downloadImage(from urlString: String, completed: @escaping(UIImage?) -> Void) {
//        let cacheKey = NSString(string: urlString)
//        if let image = cache.object(forKey: cacheKey){
//            completed(image)
//            return
//        }
//
//        guard let url = URL(string: urlString) else {
//            completed(nil)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let self = self,
//                  error == nil,
//                  let response = response as? HTTPURLResponse, response.statusCode == 200,
//                  let data = data,
//                  let image = UIImage(data: data) else {
//                completed(nil)
//                return
//            }
//
//            self.cache.setObject(image, forKey: cacheKey)
//            completed(image)
//        }
//        task.resume()
//    }
}
