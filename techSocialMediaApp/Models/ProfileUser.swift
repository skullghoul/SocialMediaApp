//
//  ProfileUser.swift
//  techSocialMediaApp
//
//  Created by Zander Ewell on 2/2/23.
//

import Foundation

struct ProfileUser: Decodable, Encodable {
    var firstName: String
    var lastName: String
    var userName: String
    var userUUID: String
    var bio: String
    var techInterests: String
//    var posts: //get post with be here
}
