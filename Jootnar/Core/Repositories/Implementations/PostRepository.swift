//
//  PostRepository.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/11/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class PostRepository: Repository, PostRepositoryProtocol {
    
    func getAllPosts(completion: @escaping ([Post]) -> Void) {
        let mockPosts: [Post] = [
        ]
        
        completion(mockPosts)
    }
}
