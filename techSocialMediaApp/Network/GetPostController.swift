//
//  GetPostController.swift
//  techSocialMediaApp
//
//  Created by Zander Ewell on 2/1/23.
//

import Foundation

class GetPostController {
    enum GetError: Error, LocalizedError {
       case PostNotLoading
    }
    
    func getPost(userSecret: UUID, pageNumber: Int) async throws -> [GetPostUser] {
        let session = URLSession.shared
        var urlComponents = URLComponents(string: "\(API.url)/posts")!
//        var request = URLRequest(url: URL(string: "\(GetPostAPI.url)/posts")!)
        
//        let credentials: [String: Any] = ["userSecret": userSecret, "pageNumber": pageNumber]
//
//        request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
//        request.httpMethod = "GET"
        
        urlComponents.queryItems = [
        URLQueryItem(name: "userSecret", value: "\(userSecret)"),
        URLQueryItem(name: "pageNumber", value: "\(pageNumber)")
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let response = response as? HTTPURLResponse
            
            
            throw GetError.PostNotLoading
        }
        let decoder = JSONDecoder()
        let posts = try decoder.decode([GetPostUser].self, from: data)
//        print(posts[0].body)
        
//        await GetPostTableViewController().tableView.reloadData()
        return posts
    }
    
    
}
