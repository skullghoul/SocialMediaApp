//
//  GetPostUser.swift
//  techSocialMediaApp
//
//  Created by Zander Ewell on 2/1/23.
//

import Foundation

struct GetPostUser: Decodable, Encodable {
    var postid: Int
    var title: String
    var body: String
    var authorUserName: String
    var authorUserId: String
    var likes: Int
    var userLiked: Bool
    var numComments: Int
    var createdDate: String
}
