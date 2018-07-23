//
//  UserService.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/13/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class UserService: Service, UserServiceProtocol {
    func getProfile(completion: @escaping (User) -> Void) {
        completion(MockUsers.daego)
    }
    
    func getFollowing(for: User, completion: @escaping (Following) -> Void) {
        completion(RawFollowing(user: MockUsers.daego, followers: [], following: []))
    }
}
