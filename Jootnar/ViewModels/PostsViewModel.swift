//
//  PostsViewModel.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/11/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class PostsViewModel {
    let dependencies: Dependencies
    
    var posts: [Post]?
    var selectedPost: Post?
    
    var onPostsDidUpdate: (() -> Void)?
    var onPostsDidNotUpdate: (() -> Void)?
    var onPostDidSelect: (() -> Void)?
    
    struct Dependencies {
        let locator: UseCaseLocator
        let listPostsUseCase: ListPostsProtocol
        
        init(locator: UseCaseLocator = UseCaseLocator(repository: PostRepository(), service: PostService())) {
            self.locator = locator
            self.listPostsUseCase = locator.listPosts
        }
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func listPosts() {
        dependencies.listPostsUseCase.listPosts { [weak self] posts in
            self?.posts = posts
            self?.onPostsDidUpdate?()
        }
    }
    
    func numberOfComments(in post: Post?) -> Int {
        if let post = post {
            return post.comments.count
        }
        return 0
    }
    
    func findPosts(for user: User?) {
        guard let user = user else {
            onPostsDidNotUpdate?()
            return
        }
        
        dependencies.listPostsUseCase.listPosts(for: user) { [weak self] posts in
            self?.posts = posts
            self?.onPostsDidUpdate?()
        }
    }
}
