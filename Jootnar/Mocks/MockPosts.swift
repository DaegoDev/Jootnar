//
//  MockPosts.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/12/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

struct MockPosts {
    static let daegoComment: CommentPost = RawCommentPost(id: 1, user: MockUsers.daego, comment: RawComment(id: 1, content: "That's a great result, keep up the work.", createdAt: Date()))
    static let bonampaComment: CommentPost = RawCommentPost(id: 2, user: MockUsers.bonampa, comment: RawComment(id: 2, content: "How did you achived that!!", createdAt: Date()) )
    static let jpohComment: CommentPost = RawCommentPost(id: 3, user: MockUsers.jpoh, comment: RawComment(id: 3, content: "Avocados!!", createdAt: Date()) )

    
    static let daegoPostFirst: Post = RawPost(id: 1, title: "Look at my progress!!", image: "https://images.pexels.com/photos/38630/bodybuilder-weight-training-stress-38630.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", description: "This is my body after 1 week of hard workouts.", createdAt: Date(), user: MockUsers.daego, comments: [bonampaComment, jpohComment], likes: 2)
    static let daegoPostSecond: Post = RawPost(id: 2, title: "Next step", image: "https://images.pexels.com/photos/260352/pexels-photo-260352.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", description: "Now i'm going for more weights.", createdAt: Date(), user: MockUsers.daego, comments: [], likes: 5)
     static let jpohPostFirst: Post = RawPost(id: 3, title: "Yolo", image: "https://images.pexels.com/photos/896059/pexels-photo-896059.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", description: "You Only Live Once", createdAt: Date(), user: MockUsers.jpoh, comments: [], likes: 5)
     static let bonampaPostFirst: Post = RawPost(id: 4, title: "A new step in my life", image: "https://images.pexels.com/photos/396133/pexels-photo-396133.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", description: "I hope is an apache helicopter.", createdAt: Date(), user: MockUsers.bonampa, comments: [], likes: 5)
}
