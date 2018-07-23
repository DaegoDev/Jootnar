//
//  GetProfile.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/13/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class GetProfile: UseCaseImplementation, GetProfileProtocol {
    func findUser(completion: @escaping (User?) -> Void) {
        guard let userService = service as? UserServiceProtocol else {
            completion(nil)
            return
        }
        
        userService.getProfile { user in
            completion(user)
        }
    }
    
    func getFollowing(for user: User?, completion: @escaping (Following?) -> Void) {
        guard let userService = service as? UserServiceProtocol, let user = user  else {
            completion(nil)
            return
        }
        
        userService.getFollowing(for: user) { following in
            completion(following)
        }
    }
}
