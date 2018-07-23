//
//  ListPosts.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/11/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class ListPosts: UseCaseImplementation, ListPostsProtocol {
    
    func listPosts(completion: @escaping ([Post]) -> Void) {
        guard let exerciseService = service as? PostServiceProtocol else {
            completion([])
            return
        }
        
        exerciseService.getAllPosts { posts in
            completion(posts)
        }
    }
    
    func listPosts(for user: User, completion: @escaping ([Post]) -> Void) {
        guard let exerciseService = service as? PostServiceProtocol else {
            completion([])
            return
        }
        
        exerciseService.getAllPosts(for: user) { posts in
            completion(posts)
        }
    }
}
