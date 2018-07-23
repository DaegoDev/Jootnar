//
//  Post.swift
//  CoordinatorExample
//
//  Created by Juan Pablo Ospina Herrera on 6/29/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

import Foundation

// MARK: - PROTOCOLS
protocol Post {
    var id: Int { get set }
    var title: String { get set }
    var image: String { get set }
    var description: String { get set }
    var createdAt: Date { get set }
    var user: User { get set }
    var comments: [CommentPost] { get set }
    var likes: Int { get set }
}

protocol PostLikes {
    var id: Int { get set }
    var user: User { get set }
    var post: Post { get set }
}

protocol CommentPost {
    var id: Int { get set }
    var user: User { get set }
    var comment: Comment { get set }
}

// MARK: - IMPLEMENTATIONS
struct RawPost: Post {
    var id: Int
    var title: String
    var image: String
    var description: String
    var createdAt: Date
    var user: User
    var comments: [CommentPost]
    var likes: Int
}

struct RawPostLikes: PostLikes {
    var id: Int
    var user: User
    var post: Post
}

struct RawCommentPost: CommentPost {
    var id: Int
    var user: User
    var comment: Comment
}
