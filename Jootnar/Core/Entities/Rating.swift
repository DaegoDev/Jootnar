//
//  Rating.swift
//  CoordinatorExample
//
//  Created by Juan Pablo Ospina Herrera on 6/29/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

import Foundation

protocol Rating {
    var id: Int { get set }
    var rate: Int { get set }
    var comment: Comment { get set }
    var user: User { get set }
}

struct RawRating: Rating {
    var id: Int
    var rate: Int
    var comment: Comment
    var user: User
}
