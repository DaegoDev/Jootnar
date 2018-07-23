//
//  UsersViewModel.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/13/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class UsersViewModel {
    let dependencies: Dependencies
    
    var user: User?
    var posts: [Post]?
    var follows: Following?
    
    var onUserDidUpdate: (() -> Void)?
    var onUserDidSelect: (() -> Void)?
    
    struct Dependencies {
        let getProfileUseCase: GetProfileProtocol
        let listPostsUseCase: ListPostsProtocol
        
        init(postsLocator: UseCaseLocator = UseCaseLocator(repository: PostRepository(), service: PostService()),
             userLocator: UseCaseLocator = UseCaseLocator(repository: UserRepository(), service: UserService())) {
            self.listPostsUseCase = postsLocator.listPosts
            self.getProfileUseCase = userLocator.getProfile
        }
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func getProfile() {
        dependencies.getProfileUseCase.findUser { [weak self] user in
            self?.user = user
            self?.dependencies.getProfileUseCase.getFollowing(for: user) { [weak self] following in
                self?.follows = following
                self?.onUserDidUpdate?()
            }
        }
    }
}
