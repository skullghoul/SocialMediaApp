//
//  ProfileController.swift
//  techSocialMediaApp
//
//  Created by Zander Ewell on 2/2/23.
//

import Foundation


class ProfileController {
    enum GetError: Error, LocalizedError {
        case PostNotLoading
    }
    
    func ProfileData(userUUID: UUID, userSecret: UUID) async throws -> [ProfileUser] {
        let session = URLSession.shared
        var urlComponents = URLComponents(string: "\(API.url)/userProfile")!
        //        var request = URLRequest(url: URL(string: "\(GetPostAPI.url)/posts")!)
        
        //        let credentials: [String: Any] = ["userSecret": userSecret, "pageNumber": pageNumber]
        //
        //        request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
        //        request.httpMethod = "GET"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "userUUID", value: "\(userUUID)"),
            URLQueryItem(name: "userSecret", value: "\(userUUID)")
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let response = response as? HTTPURLResponse
            
            throw GetError.PostNotLoading
        }
        let decoder = JSONDecoder()
        let profile = try decoder.decode([ProfileUser].self, from: data)
        //        print(posts[0].body)
        
        //        await GetPostTableViewController().tableView.reloadData()
        return profile
    }
}
