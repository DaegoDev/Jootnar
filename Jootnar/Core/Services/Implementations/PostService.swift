//
//  PostService.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/11/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class PostService: Service, PostServiceProtocol {
    
    func getAllPosts(completion: @escaping ([Post]) -> Void) {
        let posts: [Post] = [
            MockPosts.daegoPostFirst,
            MockPosts.daegoPostSecond,
            MockPosts.jpohPostFirst,
            MockPosts.bonampaPostFirst
        ]
        completion(posts)
    }
    
    func getAllPosts(for user: User, completion: @escaping ([Post]) -> Void) {
        let posts: [Post] = [
            MockPosts.daegoPostFirst,
            MockPosts.daegoPostSecond,
            ]
        completion(posts)
    }
}
